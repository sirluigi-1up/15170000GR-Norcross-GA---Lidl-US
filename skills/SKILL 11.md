---
name: owner-report-skill
description: Assemble the Weekly Owner's Report as a formatted Word document, pulling live from the RFI Log, Submittal Log, Change Order Log, Contract Milestones, Permit Tracker, Material Tracker, Risk Register, Daily Log (delays), the 3-Week Look-Ahead feed, and Photo Log tabs of the Project Control Tracker workbook. Use whenever the user asks for a weekly report, owner's report, progress report, status report to the owner/client, or wants "this week's update" assembled. Push to use this any time a recurring owner-facing report comes up — it is the one skill that reads across the whole tracker at once rather than a single log.
---

# Owner Report Skill

Builds the Weekly Owner's Report — the one document that pulls from every tab in
`Project_Control_Tracker.xlsx` at once — as a polished `.docx`, in the same PSI-branded house
style as the tracker and every other skill in this pack.

**Before writing any file, view `/mnt/skills/public/docx/SKILL.md`** and follow its
create-with-`docx`(npm) approach, its US-Letter page-size gotcha, and its "render and look at
the output" verification step. This skill tells you *what content* goes in the report and *how
it's pulled together*; the docx skill tells you *how to build the file correctly*.

## Confirm the project first

Read the **Project Info** tab before drafting anything — it has the project name, number,
owner, architect, GC, and contract dates that belong in this document's header, so you don't
have to ask the user for them each time. If more than one tracker workbook is available in
this conversation or Project, or the request could plausibly apply to more than one project,
ask which project before proceeding — never guess, and never pull or blend rows from two
different projects' trackers into one document.

## Step 1 — gather everything before drafting

Read the tracker workbook (all tabs, not just the ones the user mentioned) and pull:

- **RFI Log — every row.** This report tracks the *complete* status of every RFI, not just the
  open ones: build a full table (RFI #, Subject, Status, Days Open, Assigned To) covering every
  row in the log, sorted so Overdue rows lead, then Open, then Closed. An owner should be able
  to see the whole RFI history at a glance, not just what's currently a problem.
- **Submittal Log — every row.** Same principle: a full table (Submittal #, Description,
  Status, Days in Review) for every submittal on the log, Revise & Resubmit / overdue rows
  leading.
- **Change Order Log — every PCO and CO.** Full table (PCO/CO #, Description, Source, Cost,
  Status) for every row — Draft/Pending leading, then Approved, then Rejected/Void — plus the
  Approved running total. Don't summarize this down to "what's pending"; the owner is tracking
  contract value and needs the complete picture including what's already approved.
- **Contract Milestones — if the tab has rows.** This section only appears when Contract
  Milestones actually has data ("if available"); an empty/example-only tab means omit the
  section rather than reporting placeholder dates. For each real milestone, report its status
  exactly as the tab computes it: **Met - On Time**, **Met - Late**, **On Track**, **Due Soon**,
  or **Missed** — state it plainly ("Substantial Completion: On Track for 3/15/2027"), don't
  soften a Missed or Met - Late status.
- **Permit Tracker — every trade/permit.** Full table (Trade/Permit Type, Status, Permit
  Number, Expiration Date if applicable) for every row, ACTION NEEDED and EXPIRING SOON flags
  leading. A permit that's required but not yet applied for near-term work is schedule risk —
  say so plainly, not just "some permits pending."
- **Material Tracker — every item.** Full table (Material #, Description, Priority, Order
  Status, Expected Delivery) for every row, OVERDUE and High-priority-Not-Ordered rows leading.
  Same principle as RFIs/Submittals/COs: the owner sees complete procurement status, not just
  the problems.
- **Risk Register** — High-priority Open risks, with a one-line mitigation status each
- **Daily Log** — pull "Delays / Issues" entries from the reporting week specifically; this is
  your **Current Delays** section, and it should cite the actual dated entries, not a vague
  summary
- **3-Week Look-Ahead is a feed, not something to generate.** The user (or their team) provides
  and refreshes this tab weekly — pull it in exactly as given, don't recompute or reinterpret
  it, and don't invent look-ahead activities that aren't in the tab. If the tab looks stale
  (dates already in the past, or unchanged from the last report you're aware of), flag that to
  the user directly rather than silently reporting old data as current.
- **Photo Log** — rows where "Include in Next Owner Report?" = Yes; locate the actual image
  files (same folder as the workbook, or ask the user where they are / whether to attach them
  directly in chat) — do not fabricate or placeholder a photo that wasn't actually provided

If any of these tabs are missing rows for the current week (e.g., no Daily Log entries since
the last report), say so in the report rather than silently omitting the section — an owner
report with an unexplained gap reads as sloppy.

**Do not pull from the Schedule tab.** That tab is for internal PM use only and is deliberately
excluded from the Owner Report — Contract Milestones is the schedule information that belongs
in front of the owner.

## Step 2 — report structure

Standard sections, in this order:

1. **Cover** — Project name, number, address, and owner from Project Info; report period
   (week of X), report date, and Prepared By (default to the Project Info "Prepared By" field
   unless the user names someone else for this report specifically)
2. **Executive Summary** — 3-5 sentences: overall status, the single most important thing the
   owner needs to know this week (a delay, a decision needed, a milestone hit)
3. **Contract Milestones** — full status table, only if the tab has real data; omit the
   section entirely if it's empty rather than showing a blank table
4. **Current Delays** — pulled from Daily Log, each delay tied to its cause (an RFI #, a
   submittal #, weather, etc.) wherever the log supports that link
5. **3-Week Look-Ahead** — the provided feed, reproduced as given, grouped by week
6. **RFIs** — full status table (every RFI, not just open ones), overdue rows called out first
7. **Submittals** — full status table (every submittal), overdue/revise-resubmit rows first
8. **Change Orders / PCOs** — full status table (every PCO and CO), plus approved running total
9. **Permits** — full status table (every trade/permit), ACTION NEEDED / EXPIRING SOON leading
10. **Procurement / Materials** — full status table (every item), OVERDUE and High-priority
    Not-Ordered rows leading
11. **Risks** — High-priority open risks and mitigation status
12. **Photos** — embedded images from the Photo Log rows flagged for inclusion, each with its
    caption (Area/Location + Description) directly beneath it
13. **Action Items / Decisions Needed** — anything from the above sections that requires an
    owner decision or response, pulled together in one place so it isn't buried

## Step 3 — house style (PSI brand)

Match the tracker's visual identity exactly — this is Place Services Inc.'s actual report
branding, not a generic template:
- **Logo top-right** of the cover/header, with a thin red rule (`#DA251C`) underneath the
  title — the same treatment as PSI's own change-order reports. The logo is not a fixed file
  path — look for it among the Project's uploaded files (something like `psi_logo.png`) and use
  it if found; if no logo file is available anywhere in context, build the report without one
  rather than fabricating an image or leaving a broken reference, keep the red rule as the
  visual anchor, and mention once that adding the logo file to the Project would complete the
  branding.
- **Palette**: near-black ink (`#1A1A1A`) for headings and body text, white background, light
  gray (`#EBEBEB`) for section-break shading and table header rows, PSI red reserved only for
  what needs attention — a Missed or Met - Late milestone, an Overdue RFI, a Revise & Resubmit
  submittal, a High risk, a required backup document that's missing. Never use red for section
  headers or decoration.
- **Type**: one sans-serif family throughout (Arial or similar), clear heading hierarchy, no
  centered body text, no all-caps labels, no decorative rules — a single hairline rule under
  section headings is enough.
- **Tables over prose** wherever the tracker already has tabular data — don't re-narrate a
  table into paragraphs. Cost tables (Change Orders section) follow PSI's own cost-breakdown
  format: itemized rows, a shaded subtotal row, then a shaded final total.
- **Photos**: consistent size (e.g., 3" wide), captioned, no drop shadows or borders beyond a
  simple hairline frame.

## Step 3b — backup documents

Each of the RFI, Submittal, Change Order, Permit, and Material tables should note when a row
has backup documents on file (a small "Backup: Yes" indicator or footnote referencing the file
names from that log's "Backup Documents" column is enough — don't reproduce the documents
themselves in the report). If a row's "Backup Required?" column is Yes and "Backup Documents"
is empty, flag it explicitly in the relevant section and in Action Items — a required backup
that's missing is exactly the kind of gap an owner report should surface, not silently pass
over. For Permit Tracker specifically, a permit marked In Hand with no backup document is worth
flagging even if not contractually "required" — it means the issued permit itself isn't on file.

## Step 4 — verify before delivering

Render the `.docx` to PDF and check the page images (per the docx skill's verification step),
specifically confirming: the logo and header rule render correctly, photos actually appear and
aren't stretched/distorted, tables don't overflow the page width, and PSI red only appears on
genuine flags.

## Notes

- This report is a **snapshot** — it does not modify the tracker. If drafting it surfaces
  something that should update a log (an overdue RFI nobody's chasing, a risk that should be
  escalated), say so and offer to hand off to the relevant skill (RFI Skill, Risk Register
  Skill, etc.) rather than editing silently.
- If the user hasn't specified a reporting period, default to the 7 days ending today and say
  so explicitly at the top of the report.
