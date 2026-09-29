---
name: submittal-skill
description: Draft submittal transmittals, submittal review comments (approved / approved as noted / revise & resubmit / rejected), read a real submittal package (cut sheets, product data, shop drawings) to auto-complete the transmittal, package the transmittal and the actual submittal into one combined PDF, and reminders for overdue submittals, and keep the Submittal Log tab of the Project Control Tracker workbook in sync. Use whenever the user mentions shop drawings, product data, samples, submittal packages, or asks about submittal status/turnaround. Push to use this any time submittal tracking or drafting comes up. For "today's submittal report" or similar, point to the Daily Dashboard Skill instead — there's no separate daily submittal export anymore.
---

# Submittal Skill

Drafts submittal transmittals and status updates, and produces the row to add to the
**Submittal Log** tab of `Project_Control_Tracker.xlsx`.

## Confirm the project first

Read the **Project Info** tab before drafting anything — it has the project name, number,
owner, architect, GC, and contract dates that belong in this document's header, so you don't
have to ask the user for them each time. If more than one tracker workbook is available in
this conversation or Project, or the request could plausibly apply to more than one project,
ask which project before proceeding — never guess, and never pull or blend rows from two
different projects' trackers into one document.

## Required inputs

- Spec section and description of the item
- Type: Shop Drawing / Product Data / Sample / Mock-up / Certificate
- Subcontractor/supplier submitting it
- Date received from sub, and the contractually-required return time (default 14 calendar days
  from receipt by the architect unless the user's contract says otherwise — always ask if
  unknown rather than assume)

## Drafting a transmittal

Structure: Transmittal #, Date, Project, To (Architect/Engineer), From (GC), Spec section,
Item description, Submittal #, Re-submission number if applicable, Action requested, list of
enclosures (the actual backup documents — cut sheets, samples, shop drawings), and the
return-by date. Keep it a cover sheet — don't restate the shop drawing content. Most submittal
types contractually require backup (cut sheets at minimum); if none are on hand, say so rather
than sending a transmittal with an empty enclosures list.

## Reading a real submittal package to complete the transmittal

When the user hands you an actual submittal package (the sub's or vendor's product data, cut
sheets, or shop drawings — often a large multi-tab PDF), read what you can of it to fill in the
transmittal and tracker row yourself rather than asking the person to re-type what's already in
the document: Spec Section, item/product description, manufacturer(s), the submitting party,
and — if this is a re-submission — any prior review stamps, markups, or reviewer comments
already on the pages (architects and GCs stamp/mark cut sheets directly: "No Exceptions Taken,"
"Make Corrections Noted," "Revise & Resubmit," "Rejected," plus handwritten notes — these tell
you the current status and whether specific corrections are still outstanding).

**A real submittal package is very often far larger than Claude can visually read in one pass.**
PDF visual processing is limited to about 100 pages; a real HVAC or MEP submittal binder can run
several hundred pages across many tabs (equipment cut sheets, ductwork, controls, test-and-
balance, etc.). Don't try to visually process the whole thing:
- Read the **cover/metadata page(s) first** — most real systems put a summary page up front
  (submittal #, spec section, status, parties, due dates) exactly for this purpose; that alone
  is usually enough to complete the transmittal and tracker row.
- If there's a table of contents or tab structure, use it to know what's actually in the
  package (e.g., "Tab 1: Equipment (Lennox), Tab 2: Equipment (Captive Aire), Tab 3: Ductwork...")
  without needing to open every tab.
- If you need to verify something specific deeper in the package (a particular product's
  spec sheet, a specific review stamp), extract and read just those pages rather than the whole
  file.
- Never guess at or fabricate content from tabs/pages you haven't actually read.

## Packaging the transmittal with the actual submittal as one PDF

The final deliverable is **one combined PDF** — your PSI-branded transmittal cover sheet
followed by the actual submittal content — not a transmittal that just lists the package as a
separate attachment. This is standard practice (a GC's cover sheet placed in front of the sub's
product data before it goes to the Architect).

**Merging the full submittal behind the cover is not limited by the visual-reading threshold.**
Reading/extracting information from a PDF is capped at ~100 pages for visual fidelity; merging
existing PDF pages onto a new cover sheet is a mechanical page-copy operation with no such
limit. A 650-page submittal package can be merged in full behind a one-page cover you drafted
after reading only its first few pages — don't truncate or drop pages from the actual package
when packaging it, even though you could only visually read a fraction of it.

Name the result `Submittal-0XX_Transmittal_Packaged.pdf` and note in the tracker's Backup
Documents field that the package is included, not just referenced.

## Drafting a "chase" reminder for overdue submittals

If the tracker shows a submittal past its Required Return Date with no Date Returned, draft a
short, professional follow-up to the architect/engineer citing the submittal #, original date
sent, and the contractual review period, and asking for status. Neutral tone — this is a
process nudge, not a notice of claim (that's the Claims Skill, and only after real schedule
impact and proper notice timing are confirmed with the user).

## Output format — always give both pieces

**1. The document** (transmittal or reminder letter).

**2. The tracker row**, exact column order for **Submittal Log**:

```
Submittal #: SUB-0XX
Spec Section: <e.g. 09 3000>
Description: <item>
Type: <Shop Drawing / Product Data / Sample / Mock-up / Certificate>
Subcontractor: <name>
Date Rec'd from Sub: <date>
Date Sent to Architect: <date>
Required Return Date: <date>
Date Returned: (leave blank until back)
Status: <leave blank until returned — use the dropdown: Pending / Approved / Approved as Noted / Revise & Resubmit / Rejected>
Linked RFI #: (if the submittal was triggered by or triggers an RFI)
Backup Documents: <file names, semicolon-separated — cut sheets, sample photos, shop drawings>
Backup Required?: <Yes for most submittal types; No only for something genuinely self-explanatory>
```

Days in Review is a formula — never type over that column. If Backup Required? is Yes and
Backup Documents is empty, flag it — a submittal transmittal with no enclosures usually isn't
ready to send.

## Logging a returned submittal

When the user reports back a reviewer's action: give the update instruction — "In Submittal
Log, row for SUB-0XX: set **Date Returned** and **Status**." If Status is "Revise & Resubmit"
or "Rejected," ask whether this creates schedule risk worth a new Risk Register entry, and
offer to draft the resubmission transmittal.

## Checking the log

If asked for status, group by Status and flag anything with a Required Return Date already
passed and no Date Returned — those are overdue and worth escalating today.

## No separate daily submittal report

There is no standalone daily submittal export — the **Daily Dashboard** (see the Daily
Dashboard Skill) is the one artifact sent out daily, and it already rolls up Submittal counts
(Pending/In Review, Revise & Resubmit) plus flags any submittal stale 14+ days with no
activity. If asked for "today's submittal report," point to the Daily Dashboard rather than
building a separate file. A full submittal-only breakdown is still available anytime on
request — just answer directly from the Submittal Log (see "Checking the log" above) rather
than generating a file for it.


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
  branding if they add one to the Project's files. **If a logo file is available, actually
  place it with an image element in the header — loading the file's bytes into a variable is
  not the same as embedding it.** This exact mistake (reading the logo, never placing it, so
  the document ships with no logo despite the code "using" it) has happened before. After
  converting to PDF, render at least the first page and look at it before calling the document
  done — confirm the logo is visibly there, not just that the code referenced a file path.
- **Near-black ink (`#1A1A1A`) for all headings and body text**, white background throughout.
  Reserve PSI red for the header rule, the logo, and genuine flags (overdue, high risk, a
  required backup document that's missing, "Revise & Resubmit"/"Rejected" review responses) —
  never for decoration or section headers.
- **Light gray (`#EBEBEB`) shading for subtotal/summary rows** in any cost table, matching
  PSI's own cost-breakdown format (a shaded "SUBTOTAL" row, a shaded final total row, a
  markup line before the grand total).
- **Field-grid layout for submittal metadata, not a stacked label list.** Mimic the structure
  real submittal systems export: a two-pair grid (Label | Value | Label | Value) with a thin
  hairline rule under each row and no vertical borders — Revision/Type, Submittal Manager/
  Responsible Contractor, Submit By/Final Due Date, and so on. A field whose value is long (a
  full distribution list) gets its own full-width row rather than being squeezed into a half
  column.
- **Reviewer history goes in a table, not prose** — Name/Sent Date/Due Date/Returned Date/
  Response/Attachments columns, shaded header row, one row per reviewer, matching the
  "Submittal Workflow" structure real systems export. Flag Revise & Resubmit / Rejected
  responses in PSI red within that table.
- **Sans-serif throughout**, left-aligned. Tables carry the structure — avoid long stretches of
  unstructured prose paragraphs.
- **Say the status in words, not just color.** Color is a scanning aid, not a substitute for
  stating "Overdue" or "Missing required backup" plainly in the text.
