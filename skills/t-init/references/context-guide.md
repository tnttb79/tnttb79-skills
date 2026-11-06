# Context guide

## What goes where

| File | Reader | Holds |
|---|---|---|
| 0-START-HERE.md | human | commands, the human's job, where things are |
| human-context/ | human | what the app is and how it fits together, in plain words |
| AGENTS.md | every agent, every session | commands, stack, workflow, rules, writing rules, index |
| agent-context/ | agents, on demand | technical detail: parts, decisions, conventions, gotchas |
| specs/ | both | one folder per feature: spec.md and tasks.md |
| specs/backlog.md | both, only when asked | ideas and todos not started, one line each |

Each fact lives in one file. Other files point to it.

## What agents need

Write what an agent cannot learn from a quick look at the code: reasons for decisions, rules that span files, invariants, flows across parts, conventions that differ from the stack's defaults, and gotchas. Leave out file listings, dependency lists, generic advice and anything the code states plainly. A study of AGENTS.md files found that overviews did not help agents finish tasks and that context files raised cost by over 20%, while non-standard project rules helped (arXiv 2602.11988).

## Sizes

- AGENTS.md: under 150 lines.
- index.md: under 20 lines, one line per file: path, what it covers, when to read it.
- Numbered files: under 200 lines. Split by topic when one grows past that.
- human-context files: about a page each.

## Numbering and loading

- Files are named 001-name.md in creation order. Never renumber and never reuse a number. The index gives the reading order.
- Loading takes at most two hops: AGENTS.md, then an index.md, then one file.
- Index entries are plain paths. Do not use @ imports for them: imports load eagerly and cost as much as pasting the file.

## Nested AGENTS.md

Add one only where an area has its own commands or rules, such as a package in a monorepo. Put a one-line CLAUDE.md (@AGENTS.md) beside it and list it in the root Index. Claude Code reads AGENTS.md only when no CLAUDE.md sits at or above that folder, and Codex reads only the files from the repo root down to where it started.

## When to update

- agent-context: when a task reveals a lasting fact or gotcha, at feature end (t-build).
- human-context: only when a finished feature changes what the app does.
- AGENTS.md: when commands, stack, rules or the index change.

## Tidy checks

Dead index paths, files over size, facts the code no longer matches, specs marked done but not archived, and the same fact in two files.
