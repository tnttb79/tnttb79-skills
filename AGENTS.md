# Agent Skills Repository Guide

## Purpose

This repository is a personal skills factory: a library and development workspace for generic, reusable agent skills. Create skills once under `skills/`, keep them compatible with the open Agent Skills format, and make them installable in other projects through the `skills` CLI.

Skills may become public. Keep repository content portable, concise, and understandable without personal environment knowledge.

When helping author a skill, act as a collaborator, not an order-taker. Read the user's prompt for the capability they want, then surface the considerations they may have missed — required inputs, edge cases, constraints, expected output, repeat-run safety, and portability — that would make the skill better. Ask questions only when they materially improve the result. If the request is already clear, detailed, and covers the important aspects, proceed without asking whether the skill is good enough.

## Skill Structure

Every skill must contain `skills/<skill-name>/SKILL.md`. Add supporting directories only when they provide real value:

```text
skills/<skill-name>/
├── SKILL.md
├── references/  # detailed guidance loaded when needed
├── scripts/     # deterministic, repeatable operations
└── assets/      # reusable output resources
```

Use lowercase kebab-case for the directory and frontmatter `name`; they must match. Keep names concise and avoid harness branding unless the skill is intentionally harness-specific.

At minimum, `SKILL.md` starts with:

```yaml
---
name: your-skill
description: Describe what the skill does and when an agent should use it.
---
```

Treat `description` as routing information: state what the skill does, when it activates, and the relevant task or situation.

## Skill Design

- Give each skill one clear, reusable responsibility.
- Leave skills model-invocable by default. Make a skill manual-only only when the user explicitly requests it (for example, workflows with side effects or sensitive timing).
- State required inputs, workflow, constraints, and expected output explicitly.
- Keep interpretation and decisions in `SKILL.md`; use scripts for deterministic work and references for supporting detail.
- Make repeated runs safe and evidence-based. Do not hard-code project names, personal paths, organization configuration, or unnecessary stack assumptions.
- Prefer generic capability wording over one harness's exact tool names.
- Avoid filler, duplicated documentation, oversized `SKILL.md` files, and unrelated workflows bundled into one skill.
- Keep examples generic unless the skill intentionally targets a technology.

## Creating or Updating a Skill

1. Understand the reusable behavior and check existing skills for overlap.
2. Ask only for requirements that materially affect the design.
3. Inspect current repository conventions and the latest Agent Skills documentation.
4. Create or update `skills/<skill-name>/SKILL.md` with valid frontmatter.
5. Add references, scripts, or assets only when needed.
6. Review portability, repeat-run safety, examples, and documentation scope.
7. Run local discovery and installation checks.
8. Review the final diff and update the README skills list.

Preserve valid manual instructions when editing an existing skill. Do not commit or push unless the user explicitly requests it.

## Cross-Harness Compatibility

- Use the standard Agent Skills format as the portable core; do not create separate skill copies for Claude Code, Codex, Cursor, or other harnesses.
- Isolate a harness-specific extension only when a verified compatibility difference requires it, and document the limitation.
- Do not make a harness-specific path, frontmatter field, or behavior the default for all users.
- Verify current official behavior and supported agent identifiers before changing compatibility or installation instructions.
- Root `AGENTS.md` is the canonical repository context. `CLAUDE.md` only imports it; do not duplicate shared context in harness files.
- Manual-only flags have known costs (checked 2026-10). `disable-model-invocation: true` makes a skill unreachable in Copilot CLI 1.0.79 (github/copilot-cli#4438), and the Codex sidecar `agents/openai.yaml` with `policy.allow_implicit_invocation: false` also blocks explicit `$skill` use outside the TUI (openai/codex#40600). Prefer a description that says when the skill runs. Add the flags only when the user asks and accepts these limits.

## Local Validation

Discover skills:

```bash
npx skills add . --list
```

Install one skill, optionally for selected harnesses or as copies:

```bash
npx skills add . --skill your-skill
npx skills add . --skill your-skill --agent claude-code --agent codex --agent cursor
npx skills add . --skill your-skill --copy
```

Verify or remove a test installation:

```bash
npx skills list
npx skills remove your-skill
```

Use generic GitHub examples in documentation:

```bash
npx skills add OWNER/REPOSITORY --list
npx skills add OWNER/REPOSITORY --skill your-skill
npx skills add OWNER/REPOSITORY --skill your-skill --agent claude-code --agent codex --agent cursor
npx skills add OWNER/REPOSITORY --skill your-skill --global --agent claude-code --agent codex --agent cursor
npx skills update
```

Check frontmatter, names, sizes, links and README rows:

```bash
bash scripts/check.sh
```

Scenario evals for the workflow skills live in `evals/`; see `evals/README.md`. Neither `scripts/` nor `evals/` is installed with a skill.

Before completion, confirm discovery succeeds, test the relevant installation mode, inspect installed files when compatibility matters, and review `git diff`.

## README Maintenance

Whenever a skill is created, renamed, or removed, update the `Available Skills` table in `README.md`.

Each row must include the skill name, a one-sentence description, and its exact GitHub installation command in the form `npx skills add OWNER/REPOSITORY --skill <skill-name>`.

For normal skill work, change only the relevant table row. Do not reformat unrelated sections, change general installation instructions unless incorrect, or add long per-skill usage documentation to the root README. Keep detailed usage in the skill's directory when needed.

## Safety and Scope

- Never include credentials, tokens, private keys, connection strings, or literal `.env` values in skills, examples, or context.
- Do not invent commands, compatibility claims, or requirements; verify them from repository evidence or current official documentation.
- Avoid destructive commands and unrelated repository changes.
- Keep this file as a recurring operating guide, not a full Agent Skills tutorial or duplicate of `README.md`.
