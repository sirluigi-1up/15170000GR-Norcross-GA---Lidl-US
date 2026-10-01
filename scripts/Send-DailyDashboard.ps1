<#
  Send-DailyDashboard.ps1
  Exports the Dashboard tab of the Project Control Tracker to a one-page PDF and emails it
  through desktop Outlook (work account), with the alert counts and Stale Items listed in the body.

  Usage:
    .\scripts\Send-DailyDashboard.ps1                      # normal daily send to the distribution list
    .\scripts\Send-DailyDashboard.ps1 -To me@psi.works     # test send to one address
    .\scripts\Send-DailyDashboard.ps1 -NoSend              # export the PDF only, print the summary
#>
param(
    [string[]]$To = @('Luis.Marcelino@psi.works', 'Bobby.McTeague@psi.works', 'Tucker.Teague@psi.works'),
    [string]$ErrorTo = 'Luis.Marcelino@psi.works',
    [switch]$NoSend
)

$ErrorActionPreference = 'Stop'
$root    = Split-Path -Parent $PSScriptRoot
$tracker = Join-Path $root 'tracker\Project_Control_Tracker.xlsx'
$outDir  = Join-Path $root 'documents\daily dashboard'
$today   = Get-Date -Format 'yyyy-MM-dd'
$staleDays = 14

function Send-OutlookMail([string[]]$Recipients, [string]$Subject, [string]$Html, [string]$Attachment) {
    $ol = New-Object -ComObject Outlook.Application
    $mail = $ol.CreateItem(0)
    $mail.To = ($Recipients -join '; ')
    $mail.Subject = $Subject
    $mail.HTMLBody = $Html
    if ($Attachment) { [void]$mail.Attachments.Add($Attachment) }
    $mail.Send()
}

function HtmlEnc([string]$s) { [System.Net.WebUtility]::HtmlEncode($s) }

$xl = $null
try {
    if (-not (Test-Path $outDir)) { New-Item -ItemType Directory -Path $outDir | Out-Null }

    $xl = New-Object -ComObject Excel.Application
    $xl.Visible = $false
    $xl.DisplayAlerts = $false
    # Read-only so the export works even when someone has the tracker open.
    $wb = $xl.Workbooks.Open($tracker, 0, $true)
    $xl.CalculateFull()

    $dash = $wb.Worksheets.Item('Dashboard')
    $projName = $dash.Range('C5').Text.Trim()
    $projNum  = $dash.Range('C6').Text.Trim().TrimStart('#')

    $pdf = Join-Path $outDir "Daily_Dashboard_${projNum}_$today.pdf"
    $dash.ExportAsFixedFormat(0, $pdf)   # 0 = xlTypePDF; honors the tab's print area / fit-to-page

    # --- Read the Dashboard: section headers in B, counts in C ---
    $sections = [ordered]@{}
    $current = $null
    $staleRows = @()
    for ($r = 10; $r -le $dash.UsedRange.Row + $dash.UsedRange.Rows.Count; $r++) {
        $label = $dash.Cells.Item($r, 2).Text
        $value = $dash.Cells.Item($r, 3).Text
        if (-not $label) { continue }
        if (-not $value) { $current = $label.Trim(); $sections[$current] = @(); continue }
        if ($current) { $sections[$current] += , @($label.Trim(), $value.Trim(), $r) }
        if ($current -like 'Stale Items*') { $staleRows += $r }
    }

    # --- Stale Items detail: follow each COUNTIF back to its log and list the item #s ---
    $staleDetail = @()
    foreach ($r in $staleRows) {
        $cnt = [double]$dash.Cells.Item($r, 3).Value2
        if ($cnt -le 0) { continue }
        $label = $dash.Cells.Item($r, 2).Text.Trim()
        $f = $dash.Cells.Item($r, 3).Formula
        $items = @()
        if ($f -match "COUNTIF\('?([^'!]+)'?!\`$?([A-Z]+)\`$?(\d+):\`$?[A-Z]+\`$?(\d+)") {
            $log = $wb.Worksheets.Item($Matches[1])
            $col = $log.Range("$($Matches[2])1").Column
            $first = [int]$Matches[3]; $last = [int]$Matches[4]
            $descCol = 0
            for ($c = 1; $c -le 30; $c++) {
                if ($log.Cells.Item(1, $c).Text -match '^(Description|Subject|Risk Description|Title)') { $descCol = $c; break }
            }
            for ($i = $first; $i -le $last; $i++) {
                $d = $log.Cells.Item($i, $col).Value2
                if ($d -is [double] -and $d -ge $staleDays) {
                    $id = $log.Cells.Item($i, 1).Text
                    $desc = if ($descCol) { $log.Cells.Item($i, $descCol).Text } else { '' }
                    if ($desc.Length -gt 90) { $desc = $desc.Substring(0, 87) + '...' }
                    $items += [pscustomobject]@{ Id = $id; Desc = $desc; Days = [int]$d }
                }
            }
        }
        $staleDetail += [pscustomobject]@{ Label = $label; Count = [int]$cnt; Items = $items }
    }

    $wb.Close($false)

    # --- Build the email ---
    $sb = New-Object System.Text.StringBuilder
    [void]$sb.Append("<div style='font-family:Calibri,Arial,sans-serif;font-size:11pt;color:#1A1A1A'>")
    [void]$sb.Append("<p>Attached is today's Project Control Dashboard for <b>$(HtmlEnc $projName) #$(HtmlEnc $projNum)</b> ($today).</p>")

    [void]$sb.Append("<p style='margin-bottom:4px'><b style='color:#DA251C'>Stale Items (no activity in $staleDays+ days)</b></p>")
    if ($staleDetail.Count -eq 0) {
        [void]$sb.Append("<p style='margin-top:0'>None. Every tracked item has had activity in the last $staleDays days.</p>")
    } else {
        [void]$sb.Append("<ul style='margin-top:0'>")
        foreach ($s in $staleDetail) {
            [void]$sb.Append("<li><b>$(HtmlEnc $s.Label): $($s.Count)</b>")
            if ($s.Items.Count) {
                [void]$sb.Append("<ul>")
                foreach ($it in ($s.Items | Sort-Object Days -Descending)) {
                    $d = if ($it.Desc) { " &ndash; $(HtmlEnc $it.Desc)" } else { '' }
                    [void]$sb.Append("<li>$(HtmlEnc $it.Id)$d <span style='color:#666'>($($it.Days) days)</span></li>")
                }
                [void]$sb.Append("</ul>")
            }
            [void]$sb.Append("</li>")
        }
        [void]$sb.Append("</ul>")
    }

    [void]$sb.Append("<p style='margin-bottom:4px'><b>Snapshot</b></p><table style='border-collapse:collapse;font-size:10.5pt'>")
    foreach ($sec in $sections.Keys) {
        if ($sec -like 'Stale Items*') { continue }
        $vals = ($sections[$sec] | ForEach-Object { "$($_[0]): <b>$(HtmlEnc $_[1])</b>" }) -join ' &nbsp;&middot;&nbsp; '
        [void]$sb.Append("<tr><td style='padding:2px 12px 2px 0;vertical-align:top;white-space:nowrap'>$(HtmlEnc $sec)</td><td style='padding:2px 0'>$vals</td></tr>")
    }
    [void]$sb.Append("</table>")
    [void]$sb.Append("<p style='color:#666;font-size:9pt'>Sent automatically each weekday at 9:00 AM ET from the Project Control Tracker.</p></div>")

    $subject = "Daily Dashboard - $projName #$projNum - $(Get-Date -Format 'ddd M/d/yyyy')"

    if ($NoSend) {
        "PDF: $pdf"
        "Subject: $subject"
        $staleDetail | ForEach-Object { "$($_.Label): $($_.Count)"; $_.Items | ForEach-Object { "   $($_.Id) - $($_.Desc) ($($_.Days) days)" } }
    } else {
        Send-OutlookMail -Recipients $To -Subject $subject -Html $sb.ToString() -Attachment $pdf
        "Sent to $($To -join ', '): $pdf"
        $staleDetail | ForEach-Object { "$($_.Label): $($_.Count)"; $_.Items | ForEach-Object { "   $($_.Id) - $($_.Desc) ($($_.Days) days)" } }
    }
}
catch {
    $msg = $_.Exception.Message
    Write-Error "Daily dashboard failed: $msg"
    if (-not $NoSend) {
        try {
            Send-OutlookMail -Recipients @($ErrorTo) -Subject "Daily Dashboard FAILED - $today" `
                -Html "<p>The automated daily dashboard did not go out today.</p><p>Error: $(HtmlEnc $msg)</p>" -Attachment $null
        } catch {}
    }
    exit 1
}
finally {
    if ($xl) { $xl.Quit(); [void][Runtime.InteropServices.Marshal]::ReleaseComObject($xl) }
}
