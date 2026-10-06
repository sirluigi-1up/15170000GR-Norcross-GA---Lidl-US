---
name: grocery-postmortem-skill
description: Run a construction post-mortem / lessons-learned / closeout review for retail and grocery projects (new stores, remodels, expansions, fixture refreshes) and review the project record - RFIs, drawings, specifications, schedules, prime contracts and subcontracts, change orders, claims, submittals, daily logs, meeting minutes, permits, procurement - to generate issues, gaps, conflicts, pros and cons, root causes, lessons learned and an improvement action plan in an Excel workbook, plus a client-safe closeout summary. Use whenever the user mentions post-mortem, lessons learned, project review, closeout review, "what went wrong / what went well", cross-checking documents for conflicts or gaps, reviewing the RFI log or schedule or contract for patterns, a client closeout or improvement-plan summary, or grocery / supermarket / retail store construction retrospectives - even if they do not say "post-mortem".
---

# Grocery / Retail Construction Post-Mortem

Turns the project record into (1) an internal, candid findings workbook and (2) a diplomatic client summary of outcomes and how the company will improve.

## Principles

- **Evidence or it is not a finding.** Every finding cites a source document and a specific reference (RFI #, sheet #, spec section, schedule activity, contract clause, date). If something is inferred rather than read, mark Confidence = "Inferred - Verify". Never invent a reference number, quantity, date or clause.
- **Internal vs client are different documents.** Internal findings are candid (root causes, sub performance, margin). The client version contains no cost/margin, no sub scoring, no blame of the owner, design team or subs, and only what is marked Share w/ Client = Yes with approved wording.
- **Not legal advice.** Contract and claim observations are drafting/analysis support. Do not conclude entitlement, fault or notice validity as a legal matter; flag for counsel when claims or disputes are open.
- **Pros count.** For every document type, record what worked (fast RFI turnaround, clean addenda control, strong sub) so the company repeats it.
- **Root cause over symptom.** "Schedule slipped" is a symptom; "refrigeration rack release was not gated at buyout" is a cause an action can fix.

## Workflow

1. **Scope and intake.** Confirm project, store type (new/remodel/expansion/fixture refresh), delivery/contract type, and what source material exists. Check whether a Project Control Tracker workbook already exists in the conversation, uploads, or a connected drive - its tabs (RFI Log, Submittal Log, Change Order Log, Claims Log, Risk Register, Daily Log, Meeting Minutes Log, Material Tracker, Permit Tracker, Drawing Log, Specification Log, Owner Contract Key Terms, Contract Review Log, Bid Comparison Log) are the richest input. Read those logs instead of re-deriving what the sibling skills (rfi-skill, claims-skill, change-order-skill, submittal-skill, risk-register-skill, drawing-management-skill, spec-management-skill, owner-contract-skill, etc.) already produced. Ask the user for anything missing; do not guess at missing documents. Ask at most a few focused questions, and proceed with what is available.
2. **Create the workbook** (see "Workbook" below). New file per project.
3. **Fill the Snapshot** from tracker/contract/financial data the user supplies. Leave unknown cells blank rather than estimating.
4. **Review each document type** using `references/document-playbooks.md` (read it before reviewing - it has the checks, patterns and pro/con prompts per document type). Review in this order because later steps depend on earlier ones: Contract -> Schedule -> Drawings/Specs -> RFIs/Submittals -> Change orders/Claims -> Logs/minutes/permits/procurement.
5. **Cross-document conflict pass.** This is the highest-value step. Compare documents against each other (drawings vs specs, drawings vs equipment cut sheets, schedule vs contract milestones, subcontract vs prime flow-down, RFIs vs change orders, daily logs vs delay notices). Use the conflict matrix in the playbooks.
6. **Grocery checklist.** Rate the prompts on the Grocery Checklist tab from evidence gathered; log a finding for each Weak item. Domain background is in `references/grocery-context.md`.
7. **Log findings** with `scripts/append_findings.py` (see schema in `references/findings-schema.md`). Then do root causes, lessons, and actions: every High finding gets a root cause; every lesson gets an action with an owner and due date (ask the user for owners/dates, or leave blank - do not invent owners).
8. **Client summary.** Draft client-friendly wording per `references/client-summary-guidelines.md`, set Share w/ Client, then fill the Client Summary IDs.
9. **Recalculate and verify**, then present the workbook.

## Workbook

Build a fresh workbook (blank for real projects; sample data only for demos):

```bash
python scripts/build_postmortem_workbook.py --out /mnt/user-data/outputs/<Project>_PostMortem.xlsx --blank
```

Tabs: README, Dashboard, Snapshot, Findings Log, Root Causes, Lessons Learned, Actions, Grocery Checklist, Doc Review Coverage, Sub Scorecard, Client Summary, Lists.

Append findings or actions without disturbing formulas:

```bash
python scripts/append_findings.py <workbook> findings.json                 # Findings Log
python scripts/append_findings.py <workbook> actions.json --sheet Actions   # Actions
```

JSON keys are the column header names (see schema reference). Dropdown fields are validated; a bad value aborts with the allowed list. IDs auto-increment.

Other cells (Snapshot inputs, Root Causes, Lessons, Checklist ratings, Coverage, Sub Scorecard, Client Summary IDs) are written with openpyxl directly: load the workbook normally (not `data_only=True`, which would destroy formulas), write only blue/yellow input cells, never formula cells. Always finish with:

```bash
python /mnt/skills/public/xlsx/scripts/recalc.py <workbook> 90
```

Read `/mnt/skills/public/xlsx/SKILL.md` before editing beyond these scripts. The workbook deliberately has no charts (openpyxl drops them on re-save); the Dashboard uses data bars.

Layout facts you will need: Findings Log header row 5, data rows 6-205, columns A-W; Actions/Root Causes/Lessons header row 5, data rows 6-105; Snapshot metric rows start at row 18. Formula columns (Findings V-W, Actions J, Root Causes C and G, Snapshot variance/status, Dashboard, Coverage counts) must not be overwritten.

## Output to the user

Present the workbook with `present_files`. In the chat reply give a short summary: counts by type, the top 3-5 priority findings, which document types were not reviewed (from Doc Review Coverage), what you inferred vs confirmed, open questions, and items needing counsel. Mention that the Client Summary must be exported/copied separately and reviewed by leadership (and legal if any claim is open) before it leaves the company.

## Interaction defaults

- If the user only asks "review these RFIs/this schedule/this contract", do that review and log findings; do not force the full post-mortem.
- Large drawing sets: PDFs over 100 pages cannot be visually processed in one pass - ask for sheets split by discipline, or defer to drawing-management-skill. Do not infer quantities by scaling drawings; use only labeled dimensions, schedules and counts.
- If source files are not readable or a connector is not available, say exactly which documents were not reviewed and mark them "No" in Doc Review Coverage.
