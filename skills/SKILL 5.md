---
name: daily-log-skill
description: Turn rough field notes, voice-to-text dictation, photos, or a field-app daily report PDF (e.g. Fieldwire) into a clean daily construction report, and keep the Daily Log tab of the Project Control Tracker workbook in sync, including flagging any delay language that should also be logged as a risk or is relevant to a claim's evidentiary record. Use whenever the user mentions daily report, field notes, site log, uploads a Fieldwire/field-app PDF, or dictates what happened on site today. Push to use this any time daily-log drafting comes up, even from messy shorthand notes or a third-party export.
---

# Daily Log Skill

Converts field notes into a clean daily report and produces the row for the **Daily Log** tab
of `Project_Control_Tracker.xlsx`.

## Confirm the project first

Read the **Project Info** tab before drafting anything — it has the project name, number,
owner, architect, GC, and contract dates that belong in this document's header, so you don't
have to ask the user for them each time. If more than one tracker workbook is available in
this conversation or Project, or the request could plausibly apply to more than one project,
ask which project before proceeding — never guess, and never pull or blend rows from two
different projects' trackers into one document.

## Why this matters beyond record-keeping

Daily logs are the evidentiary backbone for delay claims and disputes — a claim citing "crew
waited on RFI-001 response" is far stronger with a contemporaneous daily log entry saying
exactly that, dated the day it happened. When drafting, **always link back to open RFIs,
submittals, or risks that affected the day's work** rather than describing delays in vague
terms ("productivity was low") — specificity is what makes the record useful later.

## Required inputs

Accept messy input — bullet points, dictation, texted notes — and normalize into: weather/temp,
crew count, subs on site, work performed (by area/trade if possible), equipment on site,
deliveries, visitors, safety incidents (state "None" explicitly, don't leave blank — a blank
looks like an omission later, "None" looks like a check was done), and delays/issues.

If the notes mention something that sounds like a safety incident, near-miss, or injury, flag
it clearly and ask whether it also needs separate incident reporting — don't just fold it
quietly into the narrative.

## Output format — always give both pieces

**1. The clean daily report** in professional narrative/bullet form, suitable to file or send.

**2. The tracker row**, exact column order for **Daily Log**:

```
Date: <date>
Weather: <conditions>
Temp (F): <number>
Crew Count: <number>
Subs on Site: <list>
Work Performed: <by area/trade>
Equipment on Site: <list>
Deliveries: <list>
Visitors: <list>
Safety Incidents: <description or "None">
Delays / Issues: <specific, dated, linked to cause where possible>
Linked RFI #(s): <if applicable>
Linked Submittal #(s): <if applicable>
Photo Ref #(s): <matching Photo Log entries, if photos were provided — see below>
```

## Ingesting a Fieldwire (or similar field-app) Daily Report PDF

Field superintendents often submit their daily report through an app like Fieldwire rather than
typing notes to you directly. When given one of these PDFs, read it and map it into the Daily
Log row rather than asking the person to re-type what's already on the page:

| Fieldwire section | Daily Log field |
|---|---|
| Date | Date |
| Weather table (condition/temp readings across the day) | Weather (condense, e.g. "Partly Cloudy, 68-89°F"), Temp (F) (use the midday or highest reading, or a range) |
| Work Log (Trade, Quantity, Hours, Notes) | Crew Count (sum Quantity across trades), Subs on Site (list the Trades), Work Performed (concatenate the Notes, numbered items collapse into one field) |
| Material Delivery | Deliveries |
| "Any schedule delays?" (+ its note) and General Notes | Delays / Issues — use the actual note verbatim where possible ("Deli case 9/23"), don't paraphrase away the specific detail |
| "Any accidents on site?" / "Any injuries reported?" | Safety Incidents — "None" if both are unchecked/no, otherwise state what was reported |
| Attachments (site photos) | Log each into the **Photo Log** tab first (date, area if identifiable, description), then reference the resulting Photo Ref #(s) here |
| Visitors / temp labor questions | Visitors, if answered — these sections are often submitted blank; don't invent a value for an unanswered field |

Fields the Fieldwire form doesn't capture (e.g. Equipment on Site isn't always itemized
separately from the Work Log) — leave blank rather than guessing, and say so if it seems like a
real gap rather than just an unused field.

The Fieldwire report's own **"Three Day Look-Ahead"** section is a valuable near-term planning
signal but is not the same thing as this tracker's 3-Week Look-Ahead tab (which is a
GC-provided weekly feed, not auto-generated — see that tab's own notes). Surface the 3-day items
to the user and suggest folding anything relevant into the 3-Week Look-Ahead the next time it's
refreshed, rather than writing into that tab directly.

If the Fieldwire report includes a "General Info" / "Additional Items Discussed in Morning
Meeting" section with open questions (e.g. "does the store need anything from the Carpenters?")
that were left blank or contain a real ask, flag those as follow-ups rather than silently
dropping them — they're often exactly the kind of item that turns into an RFI or a risk if
nobody chases it.

## Cross-linking

If a delay is tied to an open RFI or submittal, note that number in the row above AND tell the
user: "this delay is now on the record against RFI-0XX / SUB-0XX — worth mentioning if that
item turns into a change order or claim." If a new hazard or risk emerges from the day's notes,
suggest logging it via the Risk Register Skill.

## Summarizing a period

If asked to summarize a week or month from the log, read the Daily Log tab and pull out:
safety incidents, days with logged delays/issues (and their stated cause), and any pattern
across days (e.g., same sub late repeatedly).


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
