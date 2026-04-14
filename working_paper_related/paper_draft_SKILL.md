---
name: paper-benchmark-section-reviewer
description: review and refine academic benchmark, ablation, and comparison sections for consistency with source text, tables, and figures. use when chatgpt needs to (1) align section writing to an existing paper style, (2) draft or refine quality analysis, ablation, or comparison subsections, (3) check figure titles and captions against actual panels, (4) detect logic mismatches between method claims and experimental results, (5) enforce full-name-abbreviation consistency, numbering consistency, and format consistency across manuscript text, tables, and figures.
---

# Overview

Use this skill to help write, review, and debug benchmark-related sections of an academic optimization paper. Focus on section-to-figure/table consistency, logic consistency, abbreviation discipline, and manuscript-ready wording.

This skill is especially useful when the user provides:
- a benchmark/method/results markdown file
- manuscript draft sections in docx or pdf
- figure images with panel labels
- raw rank tables, WSRT/FR summaries, or per-function ranks
- requests to draft quality analysis, ablation study, comparison study, or figure/table captions

# Core workflow

## 1) Read before drafting

Always read the source material first and infer the paper's internal logic before drafting new text.

Prioritize this reading order:
1. benchmark/method markdown or source section text
2. figure images and captions
3. tables and rank summaries
4. manuscript draft sections (docx/pdf)

Before writing, extract these anchors:
- benchmark categories used in the paper
- exact meaning of each figure panel
- what each figure is supposed to prove
- statistical terms used in the manuscript
- naming and numbering of tables and figures
- full-name to abbreviation mappings already established in the paper

Do not draft from the figure alone if the source text already defines the intended interpretation.

## 2) Match the house style of the paper

When drafting a new subsection, imitate the existing benchmark-writing style of the paper without mentioning that source explicitly.

Target structure for empirical subsections:
1. purpose of the subsection
2. algorithms/variants and benchmark scope
3. what the table or figure contains
4. interpretation of the main quantitative result
5. deeper mechanism-level interpretation
6. concise concluding sentence linking back to the method design

Use formal academic prose. Prefer smooth paragraph flow over bullet-heavy writing.

## 3) Drafting rules for benchmark sections

### Quality analysis

Use this logic:
- state why the chosen functions are representative
- explain what each panel shows
- interpret convergence, diversity, and exploration-exploitation balance together
- avoid claiming "higher diversity" unless the diversity curves actually show it
- if diversity drops faster in the improved method, interpret it as more effective population concentration rather than stronger sustained diversity
- connect the observed behavior back to the actual method modules

### Ablation study

Use this logic:
- define each variant clearly
- explain what each mechanism contributes separately
- use FR/WSRT and per-function ranks as complementary evidence
- distinguish overall statistical superiority from function-level behavior
- avoid overstating a mechanism based on isolated wins
- conclude whether the two mechanisms are complementary rather than redundant

### Comparison study

Use this logic:
- begin with the overall numerical/statistical comparison
- then interpret FR/WSRT and heatmap results
- then interpret representative convergence curves and run-to-run stability
- distinguish overall consistency from isolated best-case wins
- note when the proposed method is not always fastest early but finishes better finally
- tie the interpretation back to the method design without referring to any drafting source such as md or markdown

# Figure and caption alignment checks

Always verify that the text matches the actual figure panels.

Check all of the following:
- figure number in the body matches the placed figure
- panel labels in the text match the actual panel content
- caption wording matches the actual chart types
- claims like "function-wise ranking" vs "Friedman ranking" vs "WSRT outcome counts" are used correctly
- heatmap/radar/bar/boxplot/convergence terminology matches the real figure

If the user's wording does not match the figure, state the mismatch explicitly and propose exact replacement wording.

# Logic correction rules

When checking method text against experiment results:
- flag claims that are stronger than the figure supports
- especially distinguish between:
  - broader exploratory coverage
  - maintained raw diversity
  - faster population concentration
  - better exploration-to-exploitation transition
- prefer safer wording when figures do not support strong diversity claims
- if a figure supports better-timed transition rather than persistent diversity, rewrite the method/result interpretation accordingly

When checking a manuscript, separate:
- true contradictions
- numbering/caption mismatches
- wording that is acceptable but could be polished

# Abbreviation discipline

Enforce this rule strictly:
- first mention: Full Name (FN)
- later mentions: abbreviation only

Check for:
- method names
- statistical terms
- algorithm names
- recurring experimental terms such as function evaluations (FEs) and maximum function evaluations (MaxFEs)

When reviewing, identify:
1. abbreviations never expanded
2. full names repeated unnecessarily after abbreviation has already been defined
3. inconsistent short forms across sections, tables, captions, and algorithms

# Numbering and cross-reference checks

Verify consistency across:
- section text
- figure captions
- table captions
- figure order after reordering
- counts stated in prose vs counts implied by listed functions
- cross-references in docx/pdf exports

Pay special attention to:
- swapped figure numbers after late-stage editing
- "Error! Reference source not found." remnants
- list/count mismatches such as saying 15 functions while listing 19
- duplicated table columns caused by copy/paste errors

# Response patterns

## When the user asks for a check

Respond in this order:
1. state whether the section is acceptable overall
2. list definite problems first
3. separate optional polish from required fixes
4. when possible, give exact replacement wording
5. specify exact insertion or replacement location

## When the user asks for drafting

Provide:
- subsection title
- manuscript-ready body text
- figure caption(s)
- table caption(s) when relevant

Keep references to figures and tables bold if the user requests that formatting.

## When the user asks for a final pass

Only say it is acceptable if there are no remaining substantive issues in:
- logic
- numbering
- figure-panel alignment
- abbreviation consistency
- obvious table inconsistencies

# Preferred phrasing principles

Prefer these kinds of formulations:
- "improves exploratory coverage"
- "provides structured exploratory guidance"
- "achieves a more effective exploration-to-exploitation transition"
- "remains highly competitive"
- "demonstrates stronger overall consistency"

Avoid these unless directly supported by the data:
- "maintains higher diversity"
- "broadens the search distribution" as a result claim
- references to "md", "markdown", or drafting provenance inside manuscript text

# Output checklist

Before finalizing any review or drafted subsection, verify:
- no md/markdown references remain in manuscript prose
- figure numbers and panel meanings are correct
- captions match actual visuals
- counts in prose match listed functions
- abbreviations obey full-name-first rule
- claims match what the figures and tables truly support
- wording is manuscript-ready and academically natural
