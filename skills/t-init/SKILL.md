---
name: t-init
description: Initialize or update concise shared project context for coding agents. Use when starting, formalizing, or revisiting a new or early-stage project. Inspect the repository, gather important missing decisions from the user, create the canonical AGENTS.md, and add only minimal compatibility files for detected coding-agent harnesses.
disable-model-invocation: true
---

# T Init

Initialize one small, practical project map for future coding-agent sessions. Work with an empty repository, a few starter files, an early implementation, or existing context that needs correction.

Read [references/discovery-guide.md](references/discovery-guide.md) before deciding whether to ask questions. Read [references/context-guide.md](references/context-guide.md) before writing `AGENTS.md`.

## Core rules

- Treat root `AGENTS.md` as the canonical shared context.
- Derive facts from the invocation, user answers, and repository evidence. Never invent missing details.
- Ask only for missing decisions that materially affect future work. Do not ask again about facts already supplied or discovered.
- Keep context short and project-specific. Aim for fewer than about 150 lines, but do not force a minimum length or fixed outline.
- Never include credentials, tokens, private keys, connection strings, or literal secret values.
- Keep harness files as imports or genuinely harness-specific instructions, never copies of shared context.
- Preserve valid manual constraints and make repeat runs idempotent.

## 1. Extract known context

Read the full invocation before inspecting files. Extract only explicit facts, including when supplied:

- purpose, intended users, and important use cases
- current phase, implemented work, initial scope, non-goals, and next milestone
- confirmed technical or platform decisions
- integrations and operational, security, privacy, cost, deadline, performance, or compatibility constraints
- agent responsibilities, protected areas, decision authority, and approval boundaries

Classify each item as current fact, confirmed direction, planned work, or open decision. Do not convert an aspiration into implemented behavior.

## 2. Inspect proportionately

Locate the repository root and inspect version-control status when available. Read existing instruction files before changing them, including `AGENTS.md`, `CLAUDE.md`, agent/editor configuration, and obvious harness rules.

Inspect only enough project evidence to orient future agents. Depending on what exists, check the README, manifests, source entry points, configuration, documentation, planning files, build/test/CI configuration, and recent history when it resolves a real question. Prefer current code and executable configuration for implemented behavior; prefer explicit user statements for goals and intended direction.

Accept an empty repository as valid evidence that implementation has not started. Do not fill the gap with assumptions or perform an exhaustive analysis when a small inspection is sufficient.

## 3. Run adaptive discovery

Compare known context with the material-gap test in the discovery guide.

- If important gaps remain, ask one compact numbered batch of high-value questions, then stop and wait for the user's answers. Do not write a generic `AGENTS.md` while required discovery answers are pending.
- Ask a second round only when the first answers reveal one important ambiguity that would materially change scope, constraints, authority, or the next milestone.
- If the prompt and repository already provide enough direction, ask no questions and continue.
- If the user is uncertain, accept that uncertainty. Record only consequential unresolved items under `Open Decisions`; do not force premature choices.

Questions must request concrete project facts or decisions, use plain language, and be easy to answer. Do not ask the user to design the whole architecture, select from long technology lists, or answer implementation questions before project direction is clear.

Do not manufacture an `Open Decisions` list from common choices that simply have not arisen yet. Record an item only when the user explicitly leaves it open, an approval boundary makes it important, repository sources conflict, or the current milestone cannot proceed safely without resolving it.

## 4. Create or update `AGENTS.md`

Create or update root `AGENTS.md` using the context guide.

For a new file:

- include only recurring information that future agents need to work correctly
- state the current phase honestly; an empty project may be described as planning-stage work
- separate initial scope from later ideas, and confirmed decisions from open decisions
- include commands only when verified from repository evidence
- include agent responsibilities or approval boundaries only when supplied or clearly established
- omit empty sections, placeholder values, generic advice, and facts obvious from a quick file listing

For an existing file:

1. Read it completely before editing.
2. Preserve valid user-written instructions and project-specific constraints.
3. Merge new information without duplicating sections or bullets.
4. Correct stale implemented facts only when repository evidence supports the correction.
5. Prefer explicit user statements for project goals and future direction.
6. Make the smallest coherent edit; avoid unrelated formatting changes.
7. Consolidate shared facts from harness files into `AGENTS.md` without losing valid harness-specific instructions.

Point to detailed specifications, plans, architecture records, or runbooks instead of reproducing them. Do not replace the README or expand `AGENTS.md` merely because more repository facts are discoverable.

## 5. Add minimal compatibility

Detect harnesses from the invocation, active environment, and existing project configuration. Do not create files for every possible harness.

- **Claude Code:** Current official documentation says Claude Code reads `CLAUDE.md`, not `AGENTS.md`, and supports `@` imports. When Claude Code is requested or detected, ensure root `CLAUDE.md` begins with `@AGENTS.md`. If no valid Claude-specific instructions exist, the file must contain only that line. Preserve still-valid, genuinely Claude-specific instructions below the import. Move shared context into `AGENTS.md`; do not duplicate it. Source: [Claude Code project memory](https://code.claude.com/docs/en/memory#agentsmd).
- **Codex:** Current official documentation says Codex reads `AGENTS.md` directly. Do not create a separate Codex context file. Source: [Codex project instructions](https://learn.chatgpt.com/docs/agent-configuration/agents-md).
- **Cursor:** Current official documentation says Cursor reads root and nested `AGENTS.md` directly. Do not create a Cursor rule by default. Preserve an existing rule only when it provides real Cursor-specific or scoped behavior; remove shared duplication carefully. Source: [Cursor rules](https://cursor.com/docs/rules.md#agentsmd).
- **Other harnesses:** Prefer `AGENTS.md`. Create a compatibility file only when the harness is requested or detected and current official documentation confirms that a separate file is required. If behavior cannot be verified, create nothing and report the limitation.

When multiple Claude instruction entry files already exist, avoid adding another competing copy. Consolidate safely into root `CLAUDE.md`; if removal would risk losing unclear manual instructions, preserve them and report the conflict.

## 6. Set version control hygiene

Keep installed and machine-local agent artifacts out of the repository without ignoring the shared context this skill maintains.

- Detect version control. If the project is not yet tracked and the context indicates it should be, initialize git. Do not initialize when evidence shows the project is intentionally untracked.
- Create or update root `.gitignore` to exclude installed or generated agent artifacts and local per-user state: skills and plugins installed into the project (for example a copied skills directory), MCP or harness caches, and local agent settings files. Add entries only for artifacts that actually exist or are expected from the detected harnesses; do not speculatively list every possible harness.
- Keep canonical, hand-authored shared context tracked. Root `AGENTS.md` and a thin `CLAUDE.md` import are meant to be committed so the team shares them. Do not ignore them unless the user explicitly asks.
- Preserve existing `.gitignore` content and ordering. Make the smallest coherent edit, avoid duplicate patterns, and do not reformat unrelated entries.

## 7. Review and report

Before finishing:

1. Re-read the final `AGENTS.md` and remove repetition, generic advice, speculation, and low-value detail.
2. Confirm current implementation, intended direction, and open decisions are not conflated.
3. Confirm every command is verified and no secret value appears.
4. Confirm compatibility files are only imports plus valid harness-specific instructions.
5. Compare the change with the previous context so reruns do not cause bloat or formatting churn.

Report concisely:

- questions asked, or that none were needed
- decisions captured and repository facts discovered
- files created or updated and compatibility files added
- existing instructions preserved
- open decisions and conflicts recorded
