---
name: change-order-skill
description: Draft Proposed Change Orders (PCOs), signature-ready Owner Change Orders (OCOs, which can bundle multiple PCOs into one document — mimics AIA G701 structure without reproducing the form), Construction Change Directives, and Subcontractor Change Orders (SCOs) with labor/equipment/material breakdowns, generate the weekly change order report as Excel, and keep the Change Order Log tab of the Project Control Tracker workbook in sync — including linking each CO back to the RFI, claim, or field condition that caused it, tagging which trade(s) it covers, tracking which PCOs are bundled into which OCO, and updating the Contract Milestones baseline date (with Project Info) when an executed OCO changes the contract completion date. Use whenever the user mentions change orders, PCOs, OCOs, SCOs, cost proposals, scope changes, extras, or credits, including requests to price a change down to a specific subcontractor, bundle PCOs for owner signature, confirm an OCO is executed, or wants the weekly change order report. Push to use this any time change-order drafting or tracking comes up, including "how much have we billed in change orders" type questions. (For change orders a SUBCONTRACTOR submits for GC review, use the Subcontractor CO Skill instead.)
---

# Change Order Skill

Drafts change-order paperwork and produces the row for the **Change Order Log** tab of
`Project_Control_Tracker.xlsx`. Always work from a PCO first — a PCO is the contractor's
proposal; a CO (AIA G701, or the equivalent executed change order form for a non-AIA contract —
check Owner Contract Key Terms for the actual Contract Form and use its own change-order
document if it isn't AIA) is the executed, owner-signed document. Don't draft a G701 until the
user confirms the owner has actually approved the cost and time.

## Confirm the project first

Read the **Project Info** tab before drafting anything — it has the project name, number,
owner, architect, GC, and contract dates that belong in this document's header, so you don't
have to ask the user for them each time. If more than one tracker workbook is available in
this conversation or Project, or the request could plausibly apply to more than one project,
ask which project before proceeding — never guess, and never pull or blend rows from two
different projects' trackers into one document.

## Required inputs

- Source of the change: RFI response, field condition, owner request, or design change —
  **always ask for and record the linked RFI # or Claim # if one exists.** A change order with
  no linkage back to its cause is the single most common gap that costs GCs money in a dispute.
- Scope of the change in plain terms
- Cost breakdown: labor, material, equipment, sub quotes, overhead & profit (state the markup
  % the user uses — do not assume a number)
- Schedule impact in calendar days, and whether it affects the critical path

## Drafting standard (AIA-aligned)

**PCO** — Proposed Change Order: description of work, reason/basis (cite the RFI or field
condition #), itemized cost breakdown, requested time extension, and a validity/expiration date
for the pricing. Match PSI's own cost-breakdown format for the itemized table: one row per
scope/trade (item name, quantity, unit type, unit cost, item cost), a **Subcontractor** subtotal
row, then a **Final Markups** line (the GC OH&P % applied to the subtotal, stated explicitly —
don't assume a number), then **This Change Order** as the grand total. A negative line (e.g., a
credit for descoped original-contract work) is normal and should be shown as a negative item
cost, not hidden or netted silently into another line.

**OCO (Owner Change Order)** — the executed, signature-ready document, once one or more PCOs
are ready to go to the Owner. Use **Owner_Change_Order_Template.docx** as the structure (it
mimics AIA G701 loosely — same information, not a reproduction of the AIA form): Change Order
Information, the PCOs incorporated, Contract Sum Adjustment (original sum, prior COs, this CO's
amount, new sum), Contract Time Adjustment, and Approval signatures.

**An OCO can and often does bundle multiple PCOs into one document** — this is normal practice
(e.g., several CCDs and field changes rolled into one numbered OCO for a single owner
signature), not an edge case. When asked to "put together the change order for the owner" or
similar, ask which PCOs to include if it's not obvious, list each one individually in the
"This Change Order Incorporates" table with its own cost and schedule impact, and sum them for
the Contract Sum Adjustment section. After the OCO is issued, tag every included PCO's row in
the Change Order Log with **Bundled Into OCO #** so the log shows the relationship in both
directions — don't leave the PCO rows looking like independent, un-executed items once they're
actually part of an issued OCO.

**Always ask whether Architect signature is required** before issuing the document — don't
assume it is, and don't assume it isn't. Many Design-Build, GMP, and IPD delivery methods have
no separate Architect party countersigning change orders; check the Owner Contract Key Terms
tab if it's been populated, and ask the user directly if it hasn't. Include the Architect
signature block only if the answer is yes; omit it cleanly otherwise rather than leaving a
block for a party who isn't part of this contract's approval chain.

**Keep the signature section on one page** — this document is meant to be physically or
electronically signed, and a Contractor/Owner/Architect block split across a page break is a
real problem, not just a cosmetic one. If the PCO table or adjustment sections run long, that's
where to trim or adjust spacing, never the signature blocks themselves.

## When an executed OCO changes the schedule — update the baseline, don't just log it

**This is a required step, not an optional follow-up.** A signed OCO with a non-zero Contract
Time Adjustment doesn't just add a number to the Change Order Log — it formally revises the
contract's completion date, and that revision needs to actually reach the places that report on
schedule status. When the user confirms an OCO is executed:

1. Check the OCO's net Contract Time Adjustment (from Section 4 of the document). If it's zero,
   nothing further to do here.
2. If non-zero, identify which milestone(s) it affects — almost always Substantial Completion,
   sometimes Final Completion too if it moves in lockstep. Ask the user if it's not obvious
   from the OCO which milestone(s) are affected.
3. Update that row's **Contract / Target Date** on the **Contract Milestones** tab to the new
   date — this is the contractual baseline itself changing, not a forecast or a status update,
   so the Contract / Target Date column is the right one to move (never touch Actual / Forecast
   Date for this — that column means something different: when the milestone is actually
   predicted or achieved, not what the contract requires).
4. Note what happened in that row's **Notes** field: e.g. "Extended +5 days per OCO-003,
   executed 2026-10-02" — the date changing with no explanation in the log is exactly the kind
   of silent edit this system is built to avoid.
5. Also update **Project Info**'s Substantial Completion Date field to match, since that's the
   project-level reference point people check first.
6. Say plainly, in your reply, that you updated the baseline and why — don't make this an
   invisible side effect. The Contract Milestones tab's own Status formula (On Track / Due Soon
   / Missed / Met) recalculates automatically once the date changes, and the Owner Report and
   Daily Dashboard both read this tab live, so the corrected date flows through everywhere that
   matters on their own — you don't need to touch those Skills separately, just get the
   Contract Milestones update right.

This only applies to the **contractual** baseline (Contract Milestones). It does NOT touch the
internal **Schedule** tab (activity-level baseline vs. forecast) — that's the PM's own working
schedule and a contract-level time extension doesn't automatically tell you which specific
activities shift or by how much. If the user wants the internal schedule adjusted too, that's a
separate, deliberate update to the Schedule tab, not something to infer automatically from an
OCO.

**CCD (Construction Change Directive)** — use only when the owner is directing work to proceed
before cost/time is agreed; flag clearly to the user that a CCD authorizes proceeding but does
NOT waive the contractor's right to later price the work, and that pricing must still be
submitted promptly.

**SCO (Subcontractor Change Order)** — the form a subcontractor fills out to price a change and
submit it to the GC for review (or that the GC fills out on the sub's behalf when pricing a
change down to a specific sub). Use a copy of **Subcontractor_Change_Order_Template.xlsx** — an
Excel template, not a Word form, so the math is live. It is a **horizontal, one-page landscape
form** with ONE combined breakdown table, not separate stacked Labor/Equipment/Material tables:
1. **Change Order Information** — two horizontal strips of label-over-field cells: Subcontractor
   Name, Subcontract #, SCO #, Date Submitted, Project Name, Project #, Submitted By; then Related
   PCO/CO #, Related RFI #, Schedule Impact (days), Pricing Valid Until, Original Subcontract
   Amount, Prior Approved SCOs, Trade/Scope. Type only in the light-gray cells.
2. **Description of Change** — scope added/deleted/revised, the reason, and the drawings/specs
   affected.
3. **Cost Breakdown (one table)** — each line has a **Type** (Labor / Equipment / Material /
   Subcontractor [lower-tier] / Other, from the dropdown), Description, Qty/Hours, Unit, Rate/Unit
   Cost, and a Reference/Notes cell (quote #, vendor, drawing ref). Enter Qty and Rate only — the
   line Total (`=Qty*Rate`) fills itself. Line 1 is an example to overwrite. To add lines, insert
   rows above the last line so the totals ranges expand.
4. **Summary (horizontal strip)** — Labor | Equipment | Material | Lower-Tier Sub | Other are
   `SUMIF`s on the Type column, then SUBTOTAL, Markup/OH&P %, Markup $, and TOTAL THIS
   SUBCONTRACTOR CHANGE ORDER. The only cell to touch is the Markup % (defaults to 10% — an
   assumption; set it to the subcontract's actual rate, never leave the default unchecked). A red
   CHECK line appears if any line has a Total but no Type — those lines are NOT counted in the
   Subtotal, so fix the Type rather than ignoring the warning.
5. **Backup & Submission** — backup documents attached, Subcontractor signature and date.
6. **For GC Use Only — Review** — Status dropdown, Approved Amount, Date Reviewed, Reviewed By, GC
   signature, an automatic Variance (Approved − Requested), and a Validity Assessment block. This
   maps directly onto the Subcontractor CO Log columns (see the Subcontractor CO Skill).

Because every dollar figure is a formula, never type a number directly into a Total, Subtotal,
or the Grand Total cell — enter the inputs (qty, rate, markup %) and let the sheet compute the
rest. If asked to fill one out on someone's behalf, write the input values into the correct cells
(by cell reference, e.g. "Type=Labor, Qty=16, Rate=65 in line 1") rather than describing the
total in prose — the person should see the live number in the file itself, not just take
Claude's word for what it should add up to.

An SCO is priced *into* a GC-level PCO, not instead of one — when a sub's SCO is the basis for
a PCO to the owner, link them explicitly (cite the SCO # in the PCO's backup documents, and
note the PCO/CO # on the SCO itself) so the two documents' numbers can be traced against each
other. The SCO itself is a natural **Backup Document** for the resulting PCO/CO row in the
tracker — list its file name there once it exists.

## Output format — always give both pieces

**1. The document** (PCO, OCO, CCD, or SCO as applicable).

**2. The tracker row**, exact column order for **Change Order Log**:

```
PCO/CO #: PCO-0XX (renumber to CO-0XX only once executed)
Date Initiated: <date>
Description: <one line>
Source: <Owner Request / Field Condition / RFI / Claim / Design Change>
Trade(s): <comma-separated — which trade(s) the cost/backup breaks down by>
Linked RFI #: <if applicable>
Linked Claim #: <if applicable>
Cost Amount ($): <total incl. markup>
Schedule Impact (days): <number>
Status: <Draft / Pending / Approved / Rejected / Void — use the dropdown>
Date Submitted to Owner: <date>
Date Approved (Owner CO): (leave blank until signed)
Bundled Into OCO #: <leave blank until this PCO is actually included in an issued OCO>
Backup Documents: <file names, semicolon-separated — vendor quotes, engineering calcs/CCDs,
  cost backup>
Backup Required?: <Yes — cost backup should back every change order; No only if the user
  explicitly says a lump allowance needs none>
```

Running Approved Total is a formula — never type over that column. A change order without
backup documents on a real dollar amount is the first thing an owner's auditor challenges — if
Backup Required? is Yes and nothing's listed, say so instead of leaving it blank. When the cost
breakdown spans multiple trades, tag them all in Trade(s) and organize the backup/cost-breakdown
document itself by trade (a subtotal per trade before the grand total) so a reviewer can see
where the money goes without cross-referencing separately.

**Signature block stays on one page.** When drafting the actual G701/CO document (not the PCO
worksheet), keep the signature block — Contractor/Architect/Owner blocks, dates — together on a
single page. If the cost breakdown or description runs long, put a page break before the
signature section rather than letting it split across two pages; a signature block that spills
onto its own near-empty second page reads as sloppy and complicates physical/wet-ink signing.

## Checking the log

If asked for exposure or committed-cost questions ("what's our pending change order value,"
"how much have we added to contract"), read the Change Order Log, sum Cost Amount by Status,
and report Pending vs. Approved separately — don't blend them, since Pending isn't committed
money.

## Weekly change order report (Excel, all statuses)

When asked for "this week's change order report" or similar, generate a standalone `.xlsx`
file — not just a copy of the tracker tab — covering **every PCO/CO regardless of status**
(Draft, Pending, Approved, Rejected, and Void all included), sorted with Pending first, then
Draft, then Approved, then Rejected/Void. This is a distribution document, meant to be sent to
a group, not kept as the tracker.

Structure:
- Header block: Project Name/Number (from Project Info), report title "Weekly Change Order
  Report", the date range, and the PSI logo/red rule per house style.
- One table: PCO/CO #, Description, Trade(s), Source, Cost Amount, Status, Linked RFI # —
  Rejected rows shaded in PSI red per house style.
- A summary line above the table: count by status, and Running Approved Total to date.

Save it as `Change_Order_Weekly_Report_<YYYY-MM-DD>.xlsx` and tell the person it's ready —
Claude doesn't have the ability to actually email or deliver it to a distribution list, so hand
it off as a file for them to send, and offer to draft the accompanying email if useful.


## House style — PSI brand

When a task calls for a formatted document (letter, memo, transmittal, report — not just the
tracker row), match Place Services Inc.'s actual report branding, the same look as the Project
Control Tracker workbook:

- **Logo top-right, red rule below the header.** The PSI logo is NOT a fixed file path — in
  a Claude Project, look for it among the Project's uploaded files (an image named something
  like `psi_logo.png`/`.jpg`, or referenced in another skill/doc in the Project). Use it if
  found. If no logo file is available anywhere in context, don't fabricate one or leave a
  broken image reference — build the document without it, keep the red header rule (`#DA251C`)
  as the visual anchor instead, and tell the person once that a logo file would complete the
  branding if they add one to the Project's files.
- **Near-black ink (`#1A1A1A`) for all headings and body text**, white background throughout.
  Reserve PSI red for the header rule, the logo, and genuine flags (overdue, high risk, a
  required backup document that's missing) — never for decoration or section headers.
- **Light gray (`#EBEBEB`) shading for subtotal/summary rows** in any cost table, matching
  PSI's own cost-breakdown format (a shaded "SUBTOTAL" row, a shaded final total row, a
  markup line before the grand total).
- **Sans-serif throughout**, left-aligned, plain field/value pairs (Label: Value) rather than
  boxed callouts — a clean corporate report style, not a decorative one.
- **Say the status in words, not just color.** Color is a scanning aid, not a substitute for
  stating "Overdue" or "Missing required backup" plainly in the text.
