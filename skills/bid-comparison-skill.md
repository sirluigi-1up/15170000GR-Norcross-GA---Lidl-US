---
name: bid-comparison-skill
description: Compare multiple subcontractors' bids for the same scope package — against the drawings (missing scope, notes, schedules), against each other (price, alternates, exclusions, schedule), and flag quantity mismatches using what's explicitly stated on the drawings (schedules, labeled dimensions, counts) rather than a scaled takeoff. Keeps the Bid Comparison Log tab of the Project Control Tracker workbook in sync. Use whenever the user mentions bid comparison, bid leveling, comparing subcontractor bids, choosing a low bidder, or buyout. Push to use this any time multiple bids for the same scope come up — this is the step between writing a scope (Subcontractor Contract Skill) and signing a subcontract (Subcontractor Contract Skill's redline review).
---

# Bid Comparison Skill

Compares multiple subcontractor bids for the same scope package: checks each one against the
drawings, checks each one against the others, and produces a comparison the user can actually
select a winner from — not just a list of numbers with the smallest one highlighted.

**Read this first, and hold to it throughout:** the lowest bid and the most complete bid are
often not the same bidder. This skill's entire value is surfacing that gap before an award
decision gets made on price alone.

## Confirm the project first

Read the **Project Info** tab before doing anything. If more than one tracker workbook is
available, or the request could apply to more than one project, ask which project before
proceeding.

## Step 0 — establish the scope baseline

Before looking at any bid, establish what the scope package should actually include. If the
**Subcontractor Contract Skill** has already produced a locked scope of work for this package
(from the drawings), use it directly — don't re-derive it from scratch. If it hasn't, build one
yourself following that skill's method: read the actual drawing sheets for this trade, and
extract:

- **Drawing schedules** relevant to the trade (door schedule, window schedule, equipment
  schedule, panel schedule, fixture schedule, finish schedule, etc.) — these are the single best
  source of real quantities, because they're already itemized and counted on the drawings
  themselves, not something you need to measure.
- **General and keyed notes** relevant to the trade's scope — these often carry inclusions
  (specific requirements) that don't show up as a discrete drawn item.
- **An itemized, sheet-referenced scope checklist** — what the drawings actually call for,
  organized so each item traces back to a sheet, schedule, or note.

## Step 1 — quantities: what you can and can't reliably state

**You can state a quantity when it's explicit**: a schedule row with a count, a labeled
dimension, a room square footage callout, a stated linear footage. Use these directly and cite
where each one came from (sheet/schedule).

**You cannot reliably measure quantities that aren't explicitly stated.** Don't scale unlabeled
geometry on a drawing to estimate a length, area, or count — that requires a calibrated
measurement tool (Bluebeam, PlanSwift, or similar takeoff software with the drawing's actual
scale loaded), which you don't have. If a quantity matters for the comparison and isn't stated
on the drawings, say so explicitly: "Duct routing shown on M-201 extends through the mechanical
room and corridor, but no linear footage is called out — a true quantity would need a scaled
takeoff; flagging for the user to verify or measure separately." Never present an estimated
measurement as if it were read directly from the drawing.

## Step 2 — log each bid

**Tracker row**, exact column order for **Bid Comparison Log**:

```
Bid Package #: <e.g. BP-05 Electrical — same # for every bid on this package, so they group>
Scope Description: <one line>
Related Drawing Sheets: <sheet numbers the scope/comparison is based on>
Bid Due Date: <date>
Bidder Name: <name>
Base Bid Amount ($): <the number itself, not text — this feeds the Low Bid formula>
Alternates (Summary): <e.g. "Alt 1: LED upgrade, +$6,200">
Exclusions Stated: <exactly what the bidder says they excluded>
Qualifications / Exceptions: <conditions, assumptions, or exceptions the bidder noted>
Proposed Duration (days): <number, not text>
Scope Completeness vs. Drawings: <your Step 0/1 comparison — what's covered, what's missing,
  citing sheet/schedule/note references>
Takeoff/Quantity Check: <does the bid's stated or implied quantity match the schedule/labeled
  quantity from Step 1? Flag mismatches specifically, e.g. "Door schedule shows 45 doors; bid
  scope states 40 — verify 5-door gap.">
Status: <Received / Under Review / Clarification Requested / Selected / Rejected / Withdrawn>
Apparent Low Bid (this package): (leave blank — formula, compares Base Bid Amount only)
Notes: <anything else>
Backup Documents: <the actual bid submission file>
```

Enter Base Bid Amount and Proposed Duration as actual numbers, not text — the Low Bid formula
and any future sum/average work depends on that. Apparent Low Bid is a formula and compares
**price only**; never treat it as the recommendation on its own.

## Step 3 — compare every bid against the drawings (Step 0/1), individually

For each bid, before comparing bids to each other: does this bid's stated scope actually cover
everything on the Step 0 checklist? Call out specific gaps by sheet/schedule/note reference, not
vague statements. This is where a bidder's low price often gets explained — they excluded
something the drawings clearly call for.

## Step 4 — compare the bids against each other

Build a side-by-side table: Bidder, Base Bid, Alternates, Exclusions, Proposed Duration, Scope
Completeness. Then:

- Name the apparent low bidder (price only) and the most scope-complete bidder, explicitly, even
  when they're different — especially when they're different.
- Where bidders excluded different things, note what an apples-to-apples adjusted total would
  look like if the gaps were priced in (even roughly), rather than comparing raw base bids that
  aren't actually comparable.
- Check each bidder's Proposed Duration against what the project actually needs — pull the
  relevant date from **Contract Milestones** or the **3-Week Look-Ahead** if this package is
  on the near-term critical path; flag a bid whose proposed duration doesn't fit.

## Step 5 — output

**1. The comparison document** — a formatted memo: scope baseline summary, per-bidder scope
gaps (Step 3), the side-by-side comparison (Step 4), and a recommendation section that
explicitly separates "lowest price" from "most complete/compliant" if they differ, with your
reasoning. Don't declare a winner outright unless asked to — lay out the tradeoffs and let the
user decide, the same way the Subcontractor CO Skill doesn't self-approve a change order.

**2. The tracker rows** — one per bid, per Step 2.

## After a bid is selected

Set that bid's Status to Selected, the others on the same package to Rejected or Withdrawn as
applicable. Hand the winning bid's scope off to the **Subcontractor Contract Skill** to write
the actual subcontract scope — it should match the bid that was accepted, not be re-derived
separately, and any scope gap flagged in Step 3 that wasn't resolved before award should carry
forward explicitly into that contract's scope so it doesn't get silently dropped.

## Checking the log

If asked about a package's bid status, read the Bid Comparison Log filtered to that Bid Package
#, and report the full picture — not just the apparent low bid, but the scope completeness and
quantity-check findings alongside it.

## House style — PSI brand

When a task calls for a formatted document (the comparison memo — not just the plain-text
tracker rows), match Place Services Inc.'s actual report branding, the same look as the Project
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
  Reserve PSI red for the header rule, the logo, and genuine flags (a scope gap, a quantity
  mismatch, a bidder whose duration doesn't fit) — never for decoration or section headers.
- **Field-grid layout** for the bid package header info (Package #, Scope, Due Date) — a
  two-pair grid (Label | Value | Label | Value) with a thin hairline rule under each row, no
  vertical borders, matching the same pattern the RFI and Submittal skills use. A proper table —
  not prose — for the side-by-side bid comparison itself; a comparison that has to be read
  paragraph by paragraph to find the numbers has failed its one job.
- **Sans-serif throughout**, left-aligned. Tables carry the structure — avoid long stretches of
  unstructured prose paragraphs.
- **Cite specifically.** Every scope-gap claim and every quantity-mismatch claim names the
  sheet, schedule, or note it came from — an unsupported "this bid seems incomplete" is not
  useful to someone about to award a contract on it. Say the status in words, not just color:
  "excludes fire alarm per stated exclusions" plainly in the text, not just a red cell.
