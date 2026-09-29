---
name: meeting-minutes-skill
description: Convert raw meeting notes (OAC meetings, subcontractor coordination, safety meetings) into formal minutes with tracked action items, and keep the Meeting Minutes Log tab of the Project Control Tracker workbook in sync — including linking each action item to the RFI, change order, or risk it relates to. Use whenever the user mentions meeting minutes, OAC meeting, coordination meeting, or pastes rough meeting notes. Push to use this any time minutes drafting or action-item tracking comes up.
---

# Meeting Minutes Skill

Converts rough notes into formal minutes and produces one row per action item for the
**Meeting Minutes Log** tab of `Project_Control_Tracker.xlsx`.

## Confirm the project first

Read the **Project Info** tab before drafting anything — it has the project name, number,
owner, architect, GC, and contract dates that belong in this document's header, so you don't
have to ask the user for them each time. If more than one tracker workbook is available in
this conversation or Project, or the request could plausibly apply to more than one project,
ask which project before proceeding — never guess, and never pull or blend rows from two
different projects' trackers into one document.

## Required inputs

Meeting type (OAC / Sub Coordination / Safety / Design), date, attendees, and the raw notes
or bullet points of what was discussed.

## Drafting standard

Structure: Meeting #, Date, Type, Attendees, then a numbered list of discussion items each
followed by any resulting action item, responsible party, and due date. Keep discussion points
factual summaries, not verbatim transcription. Every action item needs an owner and a due date
— "TBD" on either is a gap to flag back to the user, not something to silently fill in.

**Actively cross-reference other tabs**: if a discussion point concerns an open RFI, submittal,
change order, or risk already in the tracker, cite its number directly in the minutes ("RFI-001
— architect to respond by 9/8, see RFI Log") rather than re-describing it from scratch. This is
what keeps the whole system coherent — the minutes become the place where all the other logs
get reviewed together.

## Output format — always give both pieces

**1. The formal minutes document.**

**2. One tracker row per action item**, exact column order for **Meeting Minutes Log**:

```
Meeting #: <type prefix + number, e.g. OAC-012>
Date: <date>
Type: <OAC / Sub Coordination / Safety / Design>
Attendees: <list>
Key Discussion Point: <one line>
Action Item: <one line, specific>
Responsible Party: <name/role — required>
Due Date: <date — required>
Status: <Open — default for new items>
Linked RFI/CO/Risk #: <if applicable>
Backup Documents: <file names, semicolon-separated — sign-in sheet, presentation/handout used>
```

If a meeting produced multiple action items, give multiple rows — one meeting typically becomes
several rows in the log, each independently trackable. Backup Documents only needs to be filled
on one row per meeting (e.g., the sign-in sheet applies to the whole meeting, not one action
item specifically) — use judgment rather than repeating it needlessly on every row.

## Follow-up

If asked "what's outstanding from meetings," read the Meeting Minutes Log, filter to Status =
Open, and sort by Due Date — flag anything already past due (the sheet flags these in
red) and anything due in the next week. Suggest closing items whose linked RFI/CO/Risk has
already resolved elsewhere in the tracker.


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
