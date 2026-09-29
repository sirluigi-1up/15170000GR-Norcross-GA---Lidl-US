---
name: permit-skill
description: Research what permits are typically required for a given scope of work in a specific jurisdiction (AHJ), generate a formatted permit review report, and keep the Permit Tracker tab of the Project Control Tracker workbook in sync — status, application/issue/expiration dates, and an auto-flagged action list. Use whenever the user mentions permits, permit requirements, AHJ, building department, inspections tied to a permit, asks "what permits do we need for X," or wants a permit review report. Push to use this any time permit research or tracking comes up, including "are we missing any permits" type questions.
---

# Permit Skill

Two jobs: (1) research what permits a scope of work actually needs in a given jurisdiction, and
(2) keep the **Permit Tracker** tab of `Project_Control_Tracker.xlsx` in sync with that research
and with status updates as permits move through the AHJ.

## Confirm the project first

Read the **Project Info** tab before doing anything — it has Project Address and AHJ /
Jurisdiction, which is what makes permit research specific rather than generic. If more than
one tracker workbook is available, or the request could apply to more than one project, ask
which project before proceeding.

## Step 1 — research permit requirements

When asked what permits a scope of work needs (a new build, a tenant fit-out, an MEP change, a
demo, a sign, a fence, etc.), **web-search for the specific AHJ named in Project Info** —
permit requirements vary by state, county, and even city, so a generic national answer is not
useful and can be actively wrong. Search for things like:
- "`<AHJ / city/county name>` building permit requirements `<scope of work>`"
- "`<AHJ>` permit application `<trade>`" (electrical, plumbing, mechanical, fire alarm, etc.)
- The AHJ's own permitting/building-department website when it appears in results

Build a proposed permit list: Trade/Permit Type, whether it's typically required for this scope,
and — if findable — the responsible party convention (GC vs. sub pulls its own trade permit),
typical review timeline, and expiration/renewal terms.

**Always caveat this research plainly**: permit requirements, review timelines, and application
processes change and vary by exact scope and property zoning — this is a starting checklist to
confirm with the AHJ directly (or with the design team/permit expediter), not a substitute for
that confirmation. Never present search results as a legal determination of what is or isn't
required.

## Step 2 — keep the tracker in sync

For each permit identified (from research or from the user directly), give the tracker row.
Read the Permit Tracker tab first to avoid duplicating a trade already listed, and to find
what's already Applied/In Hand vs. still needed.

**Tracker row**, exact column order for **Permit Tracker**:

```
Trade / Permit Type: <e.g. Electrical>
Permit Required?: <Yes / No / TBD>
Responsible Party: <GC / Sub / Owner>
Permit Number: (leave blank until assigned by the AHJ)
Status: <Not Started / Applied / Under Review / In Hand / Rejected / Expired — use the dropdown>
Application Date: <date, once applied>
Approval / Issue Date: <date, once issued>
Expiration Date: <date, if the permit has one>
Notes / Next Action: <what's needed to move it forward>
Backup Documents: <file names — application, issued permit PDF, inspection reports>
Backup Required?: <Yes — the issued permit itself should be on file once In Hand>
```

Flag is a formula — never type over that column. It auto-marks ACTION NEEDED (required but not
yet started, or Rejected/Expired) and EXPIRING SOON (In Hand with an Expiration Date inside 30
days).

## Step 3 — status checks

If asked "what permits are we missing" or "what needs attention," read the Permit Tracker,
filter to Flag <> blank, and lead with ACTION NEEDED rows (a permit that's required but not yet
applied is a schedule risk, not just paperwork) before EXPIRING SOON rows. Cross-reference the
**Schedule** or **3-Week Look-Ahead** tabs if available — a permit that's not yet applied for
work starting in the look-ahead window is worth calling out explicitly as a scheduling risk,
not just a tracking gap.

## Confirming an issued permit

When the user reports a permit number or issue date: give the update instruction — "In Permit
Tracker, row for `<Trade>`: set **Permit Number**, **Status** to In Hand, **Approval / Issue
Date**, and **Expiration Date** if applicable." Ask whether the issued permit PDF is available
to log as a backup document — a permit tracker with status "In Hand" but no copy of the permit
on file is a real gap if it's ever needed for an inspection or audit.

## Permit review report

When asked for a "permit review report" — typically after researching a new scope of work, or
as a periodic check-in — generate a standalone `.xlsx` or `.docx` (match whatever the person
asks for; default to `.xlsx` since it's a tracked list) covering **every permit regardless of
status**, sorted ACTION NEEDED first, then EXPIRING SOON, then everything else.

Structure:
- Header block: Project Name/Number, Address, AHJ/Jurisdiction (all from Project Info), report
  title "Permit Review Report", the date, and the PSI logo/red rule per house style.
- One table: Trade/Permit Type, Permit Required?, Status, Permit Number, Expiration Date,
  Flag — ACTION NEEDED and EXPIRING SOON rows shaded in PSI red per house style.
- If this report follows new research (Step 1), include a short section below the table naming
  what was researched, what was found, and the same AHJ-confirmation caveat from Step 1 — don't
  drop the caveat just because it's now a formatted report instead of a chat answer.

Save it as `Permit_Review_Report_<YYYY-MM-DD>.xlsx` (or `.docx`) and tell the person it's
ready.

## House style — PSI brand

When a task calls for a formatted document (a permit research memo, a status summary — not
just the plain-text tracker row), match Place Services Inc.'s actual report branding, the same
look as the Project Control Tracker workbook:

- **Logo top-right, red rule below the header.** The PSI logo is NOT a fixed file path — in
  a Claude Project, look for it among the Project's uploaded files (an image named something
  like `psi_logo.png`/`.jpg`, or referenced in another skill/doc in the Project). Use it if
  found. If no logo file is available anywhere in context, don't fabricate one or leave a
  broken image reference — build the document without it, keep the red header rule (`#DA251C`)
  as the visual anchor instead, and tell the person once that a logo file would complete the
  branding if they add one to the Project's files.
- **Near-black ink (`#1A1A1A`) for all headings and body text**, white background throughout.
  Reserve PSI red for the header rule, the logo, and genuine flags (ACTION NEEDED, EXPIRING
  SOON) — never for decoration or section headers.
- **Light gray (`#EBEBEB`) shading for subtotal/summary rows** in any cost table, matching
  PSI's own cost-breakdown format.
- **Sans-serif throughout**, left-aligned, plain field/value pairs (Label: Value) rather than
  boxed callouts — a clean corporate report style, not a decorative one.
- **Say the status in words, not just color.** Color is a scanning aid, not a substitute for
  stating "Action needed" or "Expiring in 12 days" plainly in the text.
