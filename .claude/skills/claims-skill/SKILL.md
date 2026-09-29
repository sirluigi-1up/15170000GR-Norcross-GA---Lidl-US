---
name: claims-skill
description: Draft written notices of claim and claim narratives against the actual governing contract (AIA, GMP, Design-Build, IPD, ConsensusDocs, EJCDC, or custom — checks Owner Contract Key Terms first, falls back to AIA A201 General Conditions only if unconfirmed), check notice-deadline compliance, generate the weekly claims report as Excel, and keep the Claims Log tab of the Project Control Tracker workbook in sync. Use whenever the user mentions a claim, delay, differing site condition, notice of claim, asks whether a notice was submitted on time, or wants the weekly claims report. Push to use this any time claims drafting or notice-deadline tracking comes up — timely notice is often the single factor that decides whether a claim is even considered.
---

# Claims Skill

Drafts claim notices/narratives and produces the row for the **Claims Log** tab of
`Project_Control_Tracker.xlsx`. **The most important thing this skill does is catch notice
deadlines before they're missed** — always check this first, before drafting anything.

## Confirm the project first

Read the **Project Info** tab before drafting anything — it has the project name, number,
owner, architect, GC, and contract dates that belong in this document's header, so you don't
have to ask the user for them each time. If more than one tracker workbook is available in
this conversation or Project, or the request could plausibly apply to more than one project,
ask which project before proceeding — never guess, and never pull or blend rows from two
different projects' trackers into one document.

## Step 1 — always check the notice clock first

**Check the Owner Contract Key Terms tab first** for the actual Claim Notice Deadline and the
contract's Contract Form. If that field has been populated from the real contract (via the
Owner Contract Skill), use it — that's always better than a generic default, and doubly
important on a non-AIA contract, since GMP, Design-Build, IPD, ConsensusDocs, EJCDC, and custom
Lump Sum contracts frequently set a different notice period (sometimes shorter — 7 or 10 days
is not unusual) or a different triggering event entirely.

Only if that field is empty, fall back to the general AIA A201-2017 §15.1.3 default: written
notice within **21 days** after the contractor first recognized the condition giving rise to
the claim (not 21 days after it's fully priced) — and **say explicitly that this is an AIA
fallback, not a confirmed term, and ask the user to confirm the real deadline** (or better,
route them to the Owner Contract Skill to extract it properly) **before relying on it.** Never
apply the 21-day AIA default silently on a contract you know or suspect is a different form.

Calculate: Date of Occurrence (or date first recognized) vs. today. If more than the notice
period has already elapsed, tell the user immediately and plainly — don't bury it — since a
late notice can bar an otherwise valid claim. If still within the window, state how many days
remain.

## Step 2 — draft the notice

A notice of claim is short and protective — it does NOT need to be the full narrative yet under
most AIA-style clauses (a detailed statement can follow). Structure:
1. Reference to the specific contract clause requiring notice
2. Date and description of the event/condition
3. A statement that this is formal written notice of a claim under §15.1 (or the user's actual
   clause number)
4. A brief basis (differing condition / delay / directive / etc.)
5. A statement that cost and time impact are being compiled and will follow within the
   contractually required period (if the contract specifies one — ask; A201 does not always fix
   a second deadline for full substantiation)

Keep it factual and non-inflammatory — the goal is to preserve the right, not to argue the
merits yet.

## Step 3 — draft the full claim narrative (only once asked)

Structure: chronology of events, contract basis, cause-and-effect narrative connecting the
event to cost/schedule impact, itemized cost backup, critical-path schedule analysis if delay
is claimed, and requested relief. Link every dollar and every day back to a dated fact
(RFI, daily log entry, directive) — an unsupported number is the first thing an owner's rep
will challenge.

## Output format — always give both pieces

**1. The document** (notice or full narrative).

**2. The tracker row**, exact column order for **Claims Log**:

```
Claim #: CLM-0XX
Date of Occurrence: <date>
Notice Date: <date notice is/was sent>
Contract Notice Deadline (days): <the actual number from Owner Contract Key Terms if known;
  otherwise the AIA 21-day fallback, clearly marked as unconfirmed>
Description: <one line>
Cost Claimed ($): <amount or TBD>
Time Claimed (days): <number or TBD>
Linked CO #: <if a PCO has been raised for this claim>
Status: <Open / Submitted / Under Review / Approved / Denied / Withdrawn>
Resolution: (leave blank until resolved)
Backup Documents: <file names, semicolon-separated — photos, geotech/engineering reports, the
  notice letter itself, daily log excerpts>
Backup Required?: <Yes — a claim without contemporaneous backup is materially weaker>
```

Days to Notice and Notice Compliant? are formulas — never type over those columns. A claim's
credibility rests heavily on its backup — if Backup Required? is Yes and nothing is listed yet,
say so and suggest what to gather (site photos, the geotech report, daily log entries from the
occurrence date) rather than leaving the field blank. If the
sheet flags "NO - LATE," tell the user immediately; a late claim can still be worth pursuing in
some jurisdictions/contracts but needs to be flagged as a known weakness, not hidden.

## Checking the log

If asked for claims exposure, read the Claims Log, total Cost Claimed by Status, and flag any
row where Notice Compliant? = "NO - LATE" first — those are the highest-risk items to review
with counsel.

## Weekly claims report (Excel, all statuses)

When asked for "this week's claims report" or similar, generate a standalone `.xlsx` file —
not just a copy of the tracker tab — covering **every claim regardless of status** (Open,
Submitted, Under Review, Approved, Denied, and Withdrawn all included), sorted with any
NO - LATE notice-compliance row first, then Open, then everything else. This is a distribution
document, meant to be sent to a group, not kept as the tracker.

Structure:
- Header block: Project Name/Number (from Project Info), report title "Weekly Claims Report",
  the date range, and the PSI logo/red rule per house style.
- One table: Claim #, Description, Date of Occurrence, Notice Compliant?, Cost Claimed, Time
  Claimed, Status — NO - LATE rows shaded in PSI red per house style.
- A summary line above the table: count by status, total Cost Claimed by status (Open/Approved
  separated, not blended).

Save it as `Claims_Weekly_Report_<YYYY-MM-DD>.xlsx` and tell the person it's ready — Claude
doesn't have the ability to actually email or deliver it to a distribution list, so hand it off
as a file for them to send, and offer to draft the accompanying email if useful.


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
