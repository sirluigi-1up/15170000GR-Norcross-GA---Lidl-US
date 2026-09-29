---
name: other-contract-docs-skill
description: Review geotechnical reports, Phase I/II environmental site assessments, and other contract documents outside the core contract/drawings/specs — compile risks, what subcontractors need to be aware of, and suggested exclusions/inclusions for the subcontract and the bid. Use whenever the user mentions a geotech report, soils report, Phase I, Phase II, ESA, or any other supporting contract document that needs review. Push to use this any time review of these supporting documents comes up.
---

# Other Contract Documents Skill

Reads geotechnical reports, Phase I/II Environmental Site Assessments, and similar supporting
documents, and turns them into three concrete outputs: risks to log, things subcontractors need
to know, and specific bid/subcontract exclusion or inclusion language.

## Confirm the project first

Read the **Project Info** tab before doing anything. If more than one tracker workbook is
available, or the request could apply to more than one project, ask which project before
proceeding. Ask for the actual document if it hasn't been provided — this skill has nothing
useful to say about a report it hasn't read.

## Step 1 — read for what actually matters to construction risk

Don't summarize a geotech or environmental report front to back. Extract specifically:

**Geotechnical / soils reports**: bearing capacity and any locations where it's marginal or
variable, groundwater table depth and dewatering implications, expansive/unsuitable soil
findings, recommended foundation type vs. what's actually designed (flag any mismatch), fill
requirements, seismic design parameters if relevant, and any recommendation the report makes
that isn't yet reflected in the drawings or specs.

**Phase I ESA**: recognized environmental conditions (RECs), recommendations for further
investigation (Phase II), any known contamination history of the site or adjacent properties,
and whether a Phase II was recommended and if so, whether it's been done.

**Phase II ESA**: actual contamination findings (substance, concentration, location, depth),
remediation recommendations, regulatory reporting obligations triggered, and any use
restrictions or ongoing monitoring requirements.

## Step 2 — three outputs

**1. Risks to log** — each finding that creates real project risk becomes a Risk Register entry
candidate: description, suggested Probability/Impact (use the Risk Register Skill's scoring),
and a mitigation starting point. Hand these to the user in a form ready to log via the **Risk
Register Skill** rather than just describing them narratively.

**2. What subcontractors need to be aware of** — for each affected trade (earthwork, foundations,
utilities, anything touching the ground), a plain statement of what the report means for their
work: "Excavation contractor should be aware groundwater was encountered at 8 ft below grade at
boring B-3 — dewatering may be required and is not currently specified." This feeds the
**Subcontractor Contract Skill** when scopes get written.

**3. Bid/subcontract exclusions and inclusions** — specific language to protect the GC's bid and
flow down appropriately to subs: exclusions for conditions beyond what the report anticipated
("excludes remediation of contamination not identified in the Phase II ESA dated X"),
inclusions that should be explicit rather than assumed ("includes dewatering as needed based on
groundwater conditions per the geotechnical report"). Write this as ready-to-use clause language,
not just a description of what should be covered.

## Cross-referencing

Check whether the current drawings and specs already account for what the report found — a
geotech report calling for over-excavation that isn't reflected in the structural drawings is a
gap worth flagging loudly (it usually means a change order is coming, and better to flag it now
than after excavation starts). If a Risk Register or Drawing Log entry already covers a finding,
reference it rather than duplicating.

## House style — PSI brand

When producing a formatted document, match Place Services Inc.'s actual report branding, the
same look as the Project Control Tracker workbook:

- **Logo top-right, red rule below the header.** The PSI logo is NOT a fixed file path — in
  a Claude Project, look for it among the Project's uploaded files (an image named something
  like `psi_logo.png`/`.jpg`, or referenced in another skill/doc in the Project). Use it if
  found. If no logo file is available anywhere in context, don't fabricate one or leave a
  broken image reference — build the document without it, keep the red header rule (`#DA251C`)
  as the visual anchor instead, and tell the person once that a logo file would complete the
  branding if they add one to the Project's files.
- **Near-black ink (`#1A1A1A`) for all headings and body text**, white background throughout.
  Reserve PSI red for the header rule, the logo, and genuine flags (a drawing/spec mismatch
  with the report, an unaddressed REC) — never for decoration.
- **Sans-serif throughout**, left-aligned. Structure the three outputs (risks, sub awareness,
  bid language) as clearly separated sections — they go to different audiences and different
  logs, and shouldn't blur together.
