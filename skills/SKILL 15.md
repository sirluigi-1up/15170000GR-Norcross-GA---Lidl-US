---
name: risk-register-skill
description: Identify, score, and mitigate project risks, generate the weekly risk report as Excel, and keep the Risk Register tab of the Project Control Tracker workbook in sync — including linking risks forward to the change orders or claims they turn into. Use whenever the user mentions risk, wants a risk register, asks "what could go wrong," wants risks reviewed/updated before a milestone or OAC meeting, or wants the weekly risk report. Push to use this whenever risk identification, scoring, or mitigation planning comes up.
---

# Risk Register Skill

Identifies and scores risks and produces the row for the **Risk Register** tab of
`Project_Control_Tracker.xlsx`.

## Confirm the project first

Read the **Project Info** tab before drafting anything — it has the project name, number,
owner, architect, GC, and contract dates that belong in this document's header, so you don't
have to ask the user for them each time. If more than one tracker workbook is available in
this conversation or Project, or the request could plausibly apply to more than one project,
ask which project before proceeding — never guess, and never pull or blend rows from two
different projects' trackers into one document.

## Scoring method

Probability and Impact are each rated 1–5 (1 = rare/negligible, 5 = near-certain/severe). Risk
Score = Probability × Impact. Priority bands (already automated in the sheet): **High** ≥15,
**Medium** 8–14, **Low** <8. Be honest about scoring — inflating everything to "High" makes the
register useless for prioritization; push back gently if the user wants to rate everything at
the extremes.

## Identifying risks from other logs

If the tracker is available, actively cross-check other tabs for undeclared risks worth adding:
- **Claims Log** rows with "NO - LATE" notice compliance → add as a risk (exposure to denial)
- **Submittal Log** rows stuck in "Revise & Resubmit" near their required date → schedule risk
- **RFI Log** rows "Overdue" on path-of-schedule items → schedule risk
- **Contract Review Log** "High" risk deviations still "Open" → contractual risk
Point these out proactively rather than waiting to be asked.

## Drafting a mitigation plan

For each risk, the plan should name: a concrete action (not "monitor closely"), an owner, and
a trigger/deadline for the action. A mitigation plan with no owner or date is not a plan.

## Output format — always give both pieces

**1. A short risk narrative** if the user wants one for an OAC meeting or report (one paragraph
per risk: what it is, why it matters, what's being done).

**2. The tracker row**, exact column order for **Risk Register**:

```
Risk ID: RSK-0XX
Date Identified: <date>
Category: <e.g. Site Conditions / Schedule / Subcontractor / Design / Weather / Financial>
Description: <one line>
Probability (1-5): <n>
Impact (1-5): <n>
Mitigation Plan: <action + owner + trigger date>
Owner: <name/role>
Linked CO #: <if this risk has already produced a change order>
Linked Claim #: <if this risk has already produced a claim>
Status: <Open / Mitigating / Closed / Occurred>
```

Risk Score and Priority are formulas — never type over those columns. If a risk's Status moves
to "Occurred," prompt the user to also log the resulting Change Order or Claim so the linkage
stays real.

## Reporting

If asked for a risk summary, read the Risk Register, group by Priority, and lead with High-
priority Open items — those are what a PM or owner actually needs to see first.

## Weekly risk report (Excel, all statuses)

When asked for "this week's risk report" or similar, generate a standalone `.xlsx` file — not
just a copy of the tracker tab — covering **every risk regardless of status** (Open,
Mitigating, Closed, and Occurred all included), sorted High priority first, then Medium, then
Low, then Closed last. This is a distribution document, meant to be sent to a group, not kept
as the tracker.

Structure:
- Header block: Project Name/Number (from Project Info), report title "Weekly Risk Report",
  the date range, and the PSI logo/red rule per house style.
- One table: Risk ID, Description, Category, Probability, Impact, Risk Score, Priority,
  Mitigation Plan, Status — High priority rows shaded in PSI red per house style.
- A summary line above the table: count by priority, count Open vs. Closed/Occurred.

Save it as `Risk_Weekly_Report_<YYYY-MM-DD>.xlsx` and tell the person it's ready — Claude
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
