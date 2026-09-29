---
name: rfi-skill
description: Draft, revise, and void Requests for Information (RFIs) for a construction project under AIA-standard contracts, crop and embed one or more specific drawing details when the actual drawing file has been provided (not just referenced by sheet/detail number), embed attached photos, package a backup document directly into the RFI as one combined PDF rather than just naming it, and keep the RFI Log tab of the Project Control Tracker workbook in sync. Use this whenever the user asks to write, draft, revise, void, or respond to an RFI, mentions "request for information," references a drawing/spec conflict that needs clarification, attaches a drawing or photo, or asks "what's open on RFIs" / wants the RFI log updated. Push to use this any time RFI drafting or tracking comes up, even if the user just pastes a field question without using the word "RFI." For "today's RFI report" or similar, point to the Daily Dashboard Skill instead — there's no separate daily RFI export anymore.
---

# RFI Skill

Drafts a submittable RFI (or a response to one), and produces the exact row to add to the
**RFI Log** tab of `Project_Control_Tracker.xlsx` so the document and the tracker never drift
apart.

## Confirm the project first

Read the **Project Info** tab before drafting anything — it has the project name, number,
owner, architect, GC, and contract dates that belong in this document's header, so you don't
have to ask the user for them each time. If more than one tracker workbook is available in
this conversation or Project, or the request could plausibly apply to more than one project,
ask which project before proceeding — never guess, and never pull or blend rows from two
different projects' trackers into one document.

## When the user gives you a field question, not a formal RFI

Field notes are messy ("beam pocket doesn't match the arch drawing"). Your job is to convert
that into a submittable RFI. If the tracker workbook is attached or in the Project, read the
**RFI Log** tab first to find the next sequential RFI number and to check whether a similar
question is already open (don't create a duplicate — point it out instead).

## Required inputs (ask only for what's genuinely missing)

- Project name / number, and the contract form in use (check Project Info / Owner Contract Key
  Terms if already populated; default assumption is AIA A201 General Conditions only if
  genuinely unknown — RFI mechanics are fairly consistent across delivery methods, but always
  defer to the actual contract's terminology if it differs)
- The conflict or question itself, in the user's own words
- Drawing/spec references involved
- Who it needs to go to (architect, structural EOR, MEP engineer, owner)
- Any cost/schedule impact if the RFI isn't answered by a certain date — this is what makes an
  RFI defensible later if it becomes the basis of a change order or claim

## Drafting standard (AIA-aligned)

Structure every RFI as:
1. **Header** — RFI #, Date, Project, To/From, Reference drawings/specs
2. **Question** — one clear, answerable question. Split compound questions into separate RFIs;
   a single yes/no or specify-a-value question gets answered faster than a paragraph.
2. **Contractor's interpretation/impact statement** — a short, neutral statement of what the
   contractor will proceed with if no answer is received by the response-due date (this is what
   protects float and gives you a paper trail — don't skip it, but keep it factual, not
   argumentative)
4. **Requested response date** — default to 7 calendar days unless the contract or the user
   specifies otherwise; flag urgent RFIs (path-of-schedule items) explicitly
5. **Attachments** — list, don't embed (photos, marked-up drawings), matching the Backup
   Documents recorded in the tracker row below

Keep the tone factual and non-adversarial — an RFI is a request for information, not a claim
notice. Never draft language that admits fault or waives a right the user hasn't told you to
waive.

## Output format — always give both pieces

**1. The RFI document** (ready to paste into your transmittal form or email).

**2. The tracker row** — one line per column, in this exact order, ready to paste into
**RFI Log**:

```
RFI #: RFI-0XX
Date Submitted: <today or given date>
Submitted By: <user's name/role>
Subject: <one-line subject>
Spec Section / Drawing Ref: <refs>
Question: <the question as drafted>
Assigned To: <recipient>
Response Due Date: <date>
Response: (leave blank until answered)
Date Answered: (leave blank)
Cost Impact ($): <0 or estimate if flagged>
Schedule Impact (days): <0 or estimate if flagged>
Linked CO #: (leave blank unless this RFI is already tied to a known PCO)
Linked Submittal #: (leave blank unless relevant)
Backup Documents: <file names, semicolon-separated — marked-up drawings, photos, etc., if any>
Backup Required?: <Yes if the contract or the question itself calls for supporting drawings/
  photos to be legible without them; otherwise No>
```

Status and Days Open are formulas already in the sheet — never type over columns K or L. If
Backup Required? is Yes but no files exist yet, say so plainly rather than leaving it silent —
an RFI that needs a marked-up drawing to be understood is weaker without one attached.

## Responding to / closing out an RFI

When the user gives you an architect's/engineer's answer to log:
- Draft nothing new — just confirm the response text is unambiguous, flag if it's vague or
  conditional ("provisionally acceptable pending...") since that can later be disputed
- Give the update instructions: "In RFI Log, row for RFI-0XX: set **Response** to `<text>` and
  **Date Answered** to `<date>`." Do not touch Status or Days Open — they recalculate.
- If the response implies a cost or time change, say so explicitly and suggest the user run
  the **Change Order Skill** next, referencing this RFI number.

## Revising an RFI

If the question changes materially after submission (not just an answer coming in — an actual
correction or expansion of the question), don't silently edit the original row. Increment
**Revision #** (0 → 1 → 2...), note what changed and why in the document itself ("Revision 1 —
clarifies pocket depth in addition to width, per site verification 9/12"), and update the
tracker row's Revision # accordingly. The RFI # stays the same across revisions — it's the same
question, refined — so anyone scanning the log can still follow one thread per RFI #.

## Voiding an RFI

Use this when an RFI is withdrawn or made moot (the question resolved itself, was answered
somewhere else, or was submitted in error) — not as a way to hide an unanswered one. Confirm
with the user why before voiding. Update instruction: "In RFI Log, row for RFI-0XX: set
**Void?** to Yes." Status becomes Void automatically (the formula checks Void? first). Note the
reason in Notes or ask the user if there isn't already a notes-equivalent field to put it in —
a voided RFI with no explanation is a gap if anyone reviews the log later.

## Including a drawing crop

**The actual drawing file has to be available — a sheet/detail number alone is not enough.**
Naming "Detail 4 on S-201" tells you what to look for; it doesn't give you anything to look
at. Only crop when the real file (PDF page or image) is genuinely present — attached in chat,
in the Project's files, or in a Photo Log-style folder. If it isn't, say so plainly and
reference the sheet/detail number in text instead of describing or fabricating the graphic.

**"Available" isn't the same as "visually readable" — check the PDF page count.** Per
Anthropic's own documentation, a PDF gets full visual processing (Claude can actually see
images, charts, and drawings within it) only when it's **100 pages or fewer**; a PDF from
101-1000 pages is processed as **text only** — the visual content isn't accessible at all, even
though the file is technically present. A full combined drawing set is very often well over 100
sheets in one PDF, so it can pass the "is it available" check and still fail the "can I actually
see it" check. If a drawing reference doesn't seem to be rendering or you can't locate the
detail, check whether the source PDF is oversized before assuming the detail simply isn't
there — the practical fix is splitting the set into smaller PDFs (by discipline is usually
natural: Structural, Architectural, MEP) at 100 pages or fewer each, or attaching just the
needed sheet directly in the current chat, which gets full visual processing regardless of the
rest of the set's size.

When the file **is** available: locate the specific detail, callout, or conflict on the page
(not the whole sheet — crop tight to the relevant region) and embed that crop in the RFI
document next to the question it illustrates. This makes the RFI self-contained instead of
sending the recipient hunting through a full sheet.

**Multiple detail references work the same way, repeated per detail.** If an RFI (or a batch of
RFIs) references several details — on the same sheet or different sheets — crop each one
separately and place it next to its own question; don't merge unrelated details into one crop
or make the recipient guess which crop answers which question. Locating a specific small detail
on a busy, complex sheet is a real visual task, not a guarantee — if a callout is ambiguous, too
low-resolution to crop cleanly, or you're not confident you've isolated the right region, say so
and offer the sheet/page reference as a fallback rather than embedding a crop that might be
wrong or misleading.

**Photos are a separate, simpler case.** A photo attached directly in chat (not cropped from a
drawing — the whole photo, as given) embeds the same way: place it next to the question or
finding it supports, and caption it plainly (what it shows, where, when if known). If several
photos are attached, each gets its own placement rather than being bundled into one generic
"see attached photos" reference.

## Packaging the RFI as one PDF with backup attached

When the user gives you a backup document (a signed release letter, a manufacturer spec sheet,
a calc, anything supporting the RFI or its response), the final deliverable is **one combined
PDF** — the RFI form/question followed by the actual backup content — not the RFI alone with a
filename typed in a "Backup Documents" line. This matches how real RFI systems export them (a
question page followed directly by its attachment, all one file) and is what "packaged" means
here.

How to build it:
1. Draft the RFI document as usual and produce it as a PDF (the standard docx-to-PDF path).
2. If the backup is already a PDF, merge its pages onto the end of the RFI PDF directly
   (page-level merge, not a visual re-creation of the content) so the original formatting,
   signatures, and any scanned content survive exactly as given.
3. If the backup is an image (a photo, a scanned page), embed it as a page in the RFI document
   before converting to PDF, per the drawing-crop/photo guidance above.
4. Name the merged file `RFI-0XX_Packaged.pdf` and note in the Backup Documents tracker field
   that it's now packaged into the RFI itself, not a separate loose file.

**Merging existing PDF pages onto the end of a document is not limited by the ~100-page visual
threshold** — that limit is about Claude *visually reading/analyzing* a PDF's content, not about
mechanically combining pages for delivery. A 300-page backup document can be merged onto an RFI
in full even though only its first pages (if any) would be visually readable for extracting
information from it. Don't shorten or drop backup pages out of a mistaken belief that packaging
itself is page-limited.

## Checking the log

If asked "what RFIs are open/overdue," read the RFI Log tab and summarize by Status
(Open/Overdue/Closed/Void), calling out anything Overdue or with Response Due Date within 3
days — those are the ones worth chasing today. Void rows are informational, not actionable —
mention them only if asked for the full picture.

## No separate daily RFI report

There is no standalone daily RFI export — the **Daily Dashboard** (see the Daily Dashboard
Skill) is the one artifact sent out daily, and it already rolls up RFI counts (Open, Overdue,
Closed) plus flags any RFI stale 14+ days with no activity. If asked for "today's RFI report,"
point to the Daily Dashboard rather than building a separate file. A full RFI-only breakdown
is still available anytime on request — just answer directly from the RFI Log (see "Checking
the log" above) rather than generating a file for it.


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
  branding if they add one to the Project's files. **If a logo file is available, actually
  place it with an image element in the header — loading the file's bytes into a variable is
  not the same as embedding it.** This exact mistake (reading the logo, never placing it, so
  the document ships with no logo despite the code "using" it) has happened before. After
  converting to PDF, render at least the first page and look at it before calling the document
  done — confirm the logo is visibly there, not just that the code referenced a file path.
- **Near-black ink (`#1A1A1A`) for all headings and body text**, white background throughout.
  Reserve PSI red for the header rule, the logo, and genuine flags (overdue, high risk, a
  required backup document that's missing) — never for decoration or section headers.
- **Light gray (`#EBEBEB`) shading for subtotal/summary rows** in any cost table, matching
  PSI's own cost-breakdown format (a shaded "SUBTOTAL" row, a shaded final total row, a
  markup line before the grand total).
- **Field-grid layout for RFI metadata, not a stacked label list.** Mimic the structure real
  RFI systems export: a two-pair grid (Label | Value | Label | Value) with a thin hairline rule
  under each row and no vertical borders — Revision/Status, To/From, Date Initiated/Due Date,
  Received From/Copies To, and so on, two fields per row. This is denser and more scannable
  than a single stacked column of "Label: Value" lines, and matches what the people receiving
  these are already used to seeing.
- **Question and Response go in bordered callout boxes**, not plain paragraphs — a thin hairline
  border, a very light fill (e.g. `#FAFAF8`), a bold italic byline ("Question from `<name>`,
  `<company>`  ·  `<date>`") followed by the body text. This mirrors the boxed "Activity"
  section real RFI exports use and visually separates the Q&A thread from the metadata grid
  above it.
- **Sans-serif throughout**, left-aligned. Tables (the field-grid, the callout boxes, any cost
  breakdown) carry the structure — avoid long stretches of unstructured prose paragraphs.
- **Say the status in words, not just color.** Color is a scanning aid, not a substitute for
  stating "Overdue" or "Missing required backup" plainly in the text.
