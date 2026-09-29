---
name: drawing-management-skill
description: Manage drawings from Bid Drawings through Addenda, Revisions, and Award Drawings — keep the Drawing Log tab in sync (one row per sheet, a column per tracked revision), and produce a detailed sheet-by-sheet, note-by-note comparison of what changed between two revisions when both are visually accessible (PDFs need to be 100 pages or fewer per Anthropic's visual-processing limit — split large combined sets by discipline, or attach individual sheets directly in chat). Use whenever the user mentions drawing revisions, addenda, a new drawing set, comparing drawing sets, or asks what changed between two versions of a sheet. Push to use this any time drawing tracking or revision comparison comes up.
---

# Drawing Management Skill

Keeps the **Drawing Log** tab in sync as drawings move through Bid → Addendum → Revision →
Award, and — when given two versions of the same sheet — produces a detailed comparison of
exactly what changed.

## Confirm the project first

Read the **Project Info** tab before doing anything. If more than one tracker workbook is
available, or the request could apply to more than one project, ask which project before
proceeding.

## Logging a new drawing or a new revision

For a new sheet, create a row: Drawing #, Drawing Description, Discipline, and put the first
issuance in the **Rev 0** column as `<date> — <what it was>` (e.g., "2026-06-01 — Issued for
Bid"). Set Current Rev # to 0 and Current Rev Date to that date.

For a revision to an existing sheet, use the **next empty Rev column** for that row (Rev 1, Rev
2, etc. — the tab has 6 slots; if a sheet genuinely needs a 7th, add a column and say so rather
than overwriting an earlier one) with `<date> — <what changed, briefly>`, and update Current Rev
# and Current Rev Date. If a full comparison was done (see below), the Rev column entry should
be a one-line distillation of that comparison, not the whole thing — the detailed comparison
lives in its own document, referenced via Backup Documents.

**Tracker row fields**: Drawing #, Drawing Description, Discipline, Rev 0-5 (date + brief
change note per used slot), Current Rev #, Current Rev Date, Status (`Current` for the latest
revision of a sheet, `Superseded` for anything before it — only one row per Drawing #, so
Superseded really means "this sheet number's history," not a separate row), Backup Documents
(the actual revision PDF file names, semicolon-separated in issuance order).

## Comparing two revisions in detail

This is the core capability: given two versions of the same sheet (as images or PDF pages,
attached or in the Project's files), produce a systematic, detailed comparison — not a vague
"some things changed."

**Being "in the Project's files" only guarantees visual access under specific conditions.**
Per Anthropic's documentation, a PDF gets full visual processing (Claude can actually see the
drawing, not just extracted text) only at 100 pages or fewer; beyond that it's text-only and the
visual content — the actual drawing — isn't accessible for comparison at all. A combined
drawing set is routinely well over 100 sheets in one file, which can silently defeat this
capability even though the file is technically present. If sheets aren't visually accessible
from the Project's files, say so and suggest either splitting the set into smaller per-discipline
PDFs (100 pages or fewer each) or attaching just the two sheets being compared directly in the
current chat, which always gets full visual processing regardless of the source set's size.

Go through methodically:
1. **Title block** — revision number/date, drawn/checked by, sheet title changes.
2. **Revision clouds / delta triangles** — if the new sheet marks its own changes (most
   drawings do), start there; it's the fastest way to the actual deltas, but verify against the
   rest of the sheet too since not everything gets clouded consistently.
3. **Dimensions and geometry** — anything resized, relocated, added, or removed (walls,
   openings, equipment, structural elements).
4. **Notes and callouts** — added, removed, or reworded notes; keyed notes that changed which
   key they point to.
5. **Schedules and legends** on the sheet, if any (door/window/finish schedules embedded on the
   sheet) — line-by-line changes.
6. **Cross-references** — callouts to other sheets/details that were added, removed, or
   repointed.

Report findings **sheet by sheet, organized as Added / Removed / Modified**, each item specific
enough to act on ("Added a floor cleanout and 4-inch sanitary line at grid C-4, not present in
Rev 0" — not "some plumbing changes"). If a change has an obvious downstream effect (a note
addition that likely needs a matching submittal, spec update, or RFI response), say so and
suggest which log it belongs in — this comparison is often exactly what surfaces that an RFI
answer needs to become a Change Order, or that a spec section needs updating.

If the two files given aren't actually comparable (different sheets, or the "before" isn't
really the immediate prior revision), say so rather than forcing a comparison — a comparison
against the wrong baseline is worse than no comparison.

## Output

For routine logging: just the tracker row update.

For a requested comparison: a structured comparison document (sheet-by-sheet Added/Removed/
Modified, per above), plus the one-line summary to put in the Drawing Log's Rev column, plus a
suggestion for any downstream tracker updates the comparison implies (new RFI, spec update,
submittal impact).

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
  Reserve PSI red for the header rule, the logo, and genuine flags — never for decoration.
- **Sans-serif throughout**, left-aligned. Use tables for the Added/Removed/Modified breakdown
  rather than long paragraphs — a reviewer needs to scan this quickly.
