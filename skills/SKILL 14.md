---
name: spec-management-skill
description: Review, log, and understand project specifications; detect and record which classification system and edition is actually in use (MasterFormat 1995's 16-division vs. MasterFormat 2004+'s 50-division vs. UniFormat's element-based system, etc. — never assumed); generate the submittal register, closeout requirements, procurement requirements, and acceptable-products/vendors list from the specs; keep the Specification Log in sync, interconnected to RFIs and Submittals; and register new spec sections or updates when the Owner issues changes. Use whenever the user mentions specifications, spec sections, CSI divisions, MasterFormat, UniFormat, submittal register, or asks what a spec section requires. Push to use this any time specification review or tracking comes up.
---

# Specification Management Skill

Reads the actual project specifications and turns them into usable project-control
information: the **Specification Log**, a **Submittal Register** generated from it, and
answers about what a given section actually requires.

## Confirm the project first

Read the **Project Info** tab before doing anything. If more than one tracker workbook is
available, or the request could apply to more than one project, ask which project before
proceeding.

## Step 0 — identify the classification system and edition BEFORE logging anything

Don't assume MasterFormat 2004+ just because that's the most common system in current practice.
Check the **Specification Log**'s "Spec Format / Edition" field first — if it's already set,
use it. If not, identify it yourself from the actual spec book and populate that field before
logging a single section, since section numbers mean different things in different systems and
getting this wrong at the start makes every row after it wrong too.

**Fastest signal**: the Project Manual's cover page, table of contents, or Section 00 01 10 /
"Table of Contents" often states the edition outright ("Specifications conform to CSI
MasterFormat 2018 Edition," or similar). Check there first before pattern-matching.

**If not stated explicitly, read the numbering pattern:**

- **MasterFormat 1995 (16-Division)** — five-digit section numbers with no internal spacing:
  `02200`, `09300`, `15400`, `16050`. Divisions run 1-16, with Division 15 as a catch-all
  "Mechanical" and Division 16 as a catch-all "Electrical" (no separate divisions for fire
  suppression, plumbing, HVAC, communications, or electronic safety — they're all folded into
  15 and 16).
- **MasterFormat 2004 and later (2004, 2010, 2012, 2016, 2018 — all share the same 50-division
  skeleton; the editions differ in section-level content, not overall structure)** —
  space-delimited six-digit numbers: `09 30 00`, `26 05 00`. Divisions run 00-49, with Division
  00 (Procurement and Contracting Requirements) existing as its own division, and the old
  Division 15/16 content split out into separate divisions 21-28 (Fire Suppression, Plumbing,
  HVAC, Integrated Automation, Electrical, Communications, Electronic Safety and Security) plus
  31-35 for civil/sitework (Earthwork, Exterior Improvements, Utilities, Transportation,
  Waterway and Marine). If you need to identify which specific update (2010 vs. 2018, etc.),
  it rarely matters for project-control purposes — record "MasterFormat 2004+" unless the
  document states a specific year.
- **UniFormat / UniFormat II (ASTM E1557)** — letter-plus-four-digit codes organized by building
  *element/system*, not work result: `A1010` (Standard Foundations), `B2010` (Exterior Walls),
  `C1030` (Fittings), `D2010` (Plumbing Fixtures). Top-level categories are single letters:
  A Substructure, B Shell, C Interiors, D Services, E Equipment & Furnishings, F Special
  Construction & Demolition, G Building Sitework, Z General. This shows up more in early design/
  cost estimating and BIM-linked project manuals than in a traditional trade-by-trade spec book
  — if you see this pattern, the project is organized by building system, and "Division" as a
  concept doesn't apply the same way; use the UniFormat category instead.
- **SectionFormat/PageFormat** is not a numbering system at all — it's the three-part internal
  structure of an individual section (Part 1 General, Part 2 Products, Part 3 Execution). Every
  section in any of the systems above is usually still organized this way internally; don't
  confuse it with the classification/numbering question.
- **Other/Custom** — some older or owner-specific spec books use neither standard system. If the
  numbering doesn't match any pattern above, say so and record what you actually see rather than
  forcing it into MasterFormat or UniFormat.

Once identified, set the Spec Format / Edition field once for the project. Only fill in the
per-row **Classification System** column when a specific section genuinely differs from the
project's stated format (e.g., an old 1995-numbered base spec with one addendum section added
later in 2004+ numbering) — leave it blank otherwise rather than repeating the project-level
value on every row.

## Logging a spec section

For each section reviewed, extract: Spec Section # and Title (numbered per whatever system Step
0 identified — don't silently convert a 1995-style `09300` into 2004+ `09 30 00` notation or
vice versa; record it exactly as the actual document numbers it), Division (or UniFormat
category), which drawings it relates to (cross-check the **Drawing Log**), whether it requires a
submittal and what type (product data, shop drawings, samples, certificates), closeout
requirements specific to that section (O&M manuals, warranties, extra stock, training),
acceptable products/vendors or "or equal" provisions, and any linked RFI or Submittal # already
in those logs for this section.

**Tracker row**, exact column order for **Specification Log**:

```
Spec Section #: <numbered exactly as the actual document shows it — e.g. "09 30 00" for
  MasterFormat 2004+, "09300" for 1995, "C2010" for UniFormat>
Section Title: <name>
Division: <Division ## — Name, or the UniFormat category letter/name if that's the system in use>
Classification System: <leave blank if it matches the project's Spec Format / Edition field;
  only fill in if this specific section differs from the project default>
Related Drawing(s): <sheet numbers>
Submittal Required?: <Yes / No / TBD>
Submittal Type: <Product Data, Shop Drawings, Samples, Certificates — as applicable>
Closeout Requirement: <O&M manual, warranty period, extra stock %, training — whatever this
  section specifically requires>
Acceptable Products / Vendors: <named products/manufacturers, or "or equal per Section 01 6000"
  — reference the actual general-requirements section number in whatever system is in use>
Linked RFI #: <if applicable>
Linked Submittal #: <if applicable>
Revision / Update Date: <date>
Status: <Current / Superseded>
Notes: <anything else worth flagging>
Backup Documents: <the actual spec section file name>
```

## Generating the Submittal Register

When asked to build or refresh the submittal register: read every **Current** row in the
Specification Log where Submittal Required? = Yes, and produce one entry per section (Spec
Section #, Title, Submittal Type, and a blank Status/Due Date for the user to fill in as it
gets scheduled). This is the master list of what submittals the project needs — cross-check
against the **Submittal Log** for what's already been created, and flag any section requiring a
submittal that doesn't have a corresponding Submittal Log entry yet, that's a gap before it
becomes a missed submittal.

## Procurement and closeout requirements

When asked what a section requires for procurement (lead time flags, vendor requirements) or
closeout, pull directly from that section's Closeout Requirement and Acceptable Products /
Vendors fields — don't generalize from "typical" requirements. If the Material Tracker doesn't
yet have an entry for a long-lead item this section implies, say so and suggest logging it via
the Material Tracker Skill.

## Registering an Owner-issued spec change

When the Owner issues a new or revised spec section (via addendum, bulletin, or direct
revision): mark the prior row's Status as Superseded (don't delete it — history matters for
disputes), add a new row for the current version with an incremented Revision/Update Date, and
check whether the change affects anything already in motion — an open RFI referencing the old
section, a Submittal already prepared against the old requirement, or a Material Tracker entry
whose specified product is no longer acceptable. Flag any of those explicitly; a spec update
that silently invalidates a submittal in progress is exactly the kind of gap this log exists to
catch.

Also check the new section's numbering against the project's Spec Format / Edition — an
addendum occasionally introduces a section numbered in a different system than the base spec
book (most often a newer MasterFormat 2004+ section added into an older 1995-based project
manual during a late renovation or addition). If that happens, note it in that row's
Classification System column rather than silently treating it as consistent with the rest of
the log.

## House style — PSI brand

When producing a formatted document (the submittal register, a spec summary — not just the
plain-text tracker row), match Place Services Inc.'s actual report branding, the same look as
the Project Control Tracker workbook:

- **Logo top-right, red rule below the header.** The PSI logo is NOT a fixed file path — in
  a Claude Project, look for it among the Project's uploaded files (an image named something
  like `psi_logo.png`/`.jpg`, or referenced in another skill/doc in the Project). Use it if
  found. If no logo file is available anywhere in context, don't fabricate one or leave a
  broken image reference — build the document without it, keep the red header rule (`#DA251C`)
  as the visual anchor instead, and tell the person once that a logo file would complete the
  branding if they add one to the Project's files.
- **Near-black ink (`#1A1A1A`) for all headings and body text**, white background throughout.
  Reserve PSI red for the header rule, the logo, and genuine flags (a submittal gap, an
  invalidated submittal after a spec change) — never for decoration.
- **Sans-serif throughout**, left-aligned, tables over prose wherever the data is tabular.
