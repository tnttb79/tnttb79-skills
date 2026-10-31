# Lecture Authoring Guide

Detailed conventions for writing the walkthrough lectures. Loaded during Step 3 (and Step 1
when planning delegation).

## Per-lecture anatomy

Each lecture (except `00`) should, when relevant to its topic, cover:

- **What problem it solves** and why the code needs to exist.
- **Where it fits** in the overall architecture.
- **How data and control flow** through it — the actual call path or request lifecycle, not
  a file-by-file listing.
- **Key design trade-offs** the implementation made, and why.
- **Common pitfalls** or non-obvious behavior a newcomer would trip on.

Structure for scanning: a short intro paragraph, then headed sections. A newcomer should be
able to read the intro and section headers alone and know what the topic contains.

## Evidence discipline

- Base every claim on repository evidence. Inspect the actual current source for the topic;
  trace referenced functions, types, components, routes, schemas, and imports across file
  and package boundaries. Don't explain a file in isolation when its behavior depends on
  another file.
- Show the code you explain. When a point rests on specific code, include a short snippet
  labelled with its repo-relative path and symbol or line range, for example
  `src/auth/session.ts:42-58` (`createSession`), so the reader can jump there.
- Quote only the relevant portion of a file, not the whole thing. Prefer a few lines that
  make the point over a long block, and mark cut lines with `...`.
- Verify every path, symbol name, and quoted snippet against the repository before
  finishing. Do not rely on conventions assumed from similar projects — this codebase may
  differ.
- If you can't confirm something from the source, say so in the lecture rather than
  guessing. An honest "this appears to handle X; the exact mechanism isn't clear from the
  code" beats a confident wrong claim.

## Conciseness

This is a map, not a reference manual. Favor short, clear explanations over completeness in
the file itself. The user can tag a specific lecture and ask a follow-up to go deeper on any
point, so don't pre-empt every question — leave room for it.

## Large-codebase delegation

When per-topic evidence-gathering is too expensive to do serially:

1. Finish the topic outline first (Step 1) so each sub-agent has a bounded scope and a fixed
   file set.
2. Launch one read-only research sub-agent per topic in parallel. Give each the topic, its
   mapped files, and instructions to return: the call/data flow, key symbols with paths and
   line numbers, design trade-offs observed, and verified snippets.
3. Write every lecture yourself from the returned research. Keep one consistent voice,
   calibrated to the reader's stated background, and make cross-references between lectures
   correct (a lecture that builds on another should name it).

Delegation is for gathering evidence, not for writing — split authorship produces
inconsistent tone and broken cross-references.
