# Concise context guide

Root `AGENTS.md` is the canonical project map and operating guide for coding agents. It is not a full specification, architecture document, project history, or replacement for the README.

## Selection test

Include an item only when future agents will repeatedly need it to work correctly and are unlikely to infer it safely at the moment of use. Prefer:

- purpose, current phase, initial scope, and important non-goals
- confirmed decisions and current priorities
- boundaries, approval requirements, and protected areas
- verified commands or validation expectations
- links to authoritative detailed documents
- consequential open decisions

Omit generic development advice, tutorials, exhaustive directory trees, manifest summaries, detailed specifications, speculative plans, stale history, and facts obvious from a quick repository inspection.

## Flexible outline

Choose only useful sections. Possible headings include:

- Purpose or Goal
- Users and Core Use Cases
- Current State
- Initial Scope and Non-Goals
- Confirmed Decisions or Technical Direction
- Development Workflow
- Quality and Verification
- Constraints
- Agent Responsibilities and Approval Boundaries
- Current Priority
- Open Decisions
- Important References

A small project may need only a title and a few short sections. Omit sections with no meaningful content; never fill them with `TBD`, `None`, `Unknown`, or generic placeholders. As a general target, stay below about 150 lines unless recurring project complexity genuinely requires more.

## Preserve distinctions

- **Current state:** What repository evidence shows exists now.
- **Confirmed direction:** Decisions explicitly made by the user or authoritative project documents.
- **Planned work:** Intended work not yet implemented; include only when it affects current decisions.
- **Open decisions:** Consequential unresolved choices raised by the user, an approval boundary, conflicting evidence, or the current milestone. Omit harmless uncertainty and routine choices that have not arisen.

For an empty project, say plainly that it is in planning or initialization and list only confirmed direction. Do not invent commands, dependencies, folders, services, or architecture.

## Keep details elsewhere

Link to the README for human onboarding, specifications for detailed requirements, architecture records for rationale, and runbooks for operations. Summarize only the part agents need every session.

Include a command only after verifying it in a manifest, task runner, configuration, CI workflow, or other reliable source. Never copy secrets or literal environment values; mention a variable name only when it changes how agents work.

## Update without bloat

On repeat runs, retain stable wording when it remains accurate. Add a new item only when it passes the selection test. Merge overlapping bullets, remove clearly stale facts, and avoid formatting-only rewrites. Preserve valid manual instructions and report unresolved conflicts.

Shared context belongs only in `AGENTS.md`. Compatibility files should contain a supported import/reference plus genuinely harness-specific instructions, never a second summary.
