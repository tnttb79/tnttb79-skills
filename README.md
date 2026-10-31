# tnttb79-skills

A personal skills factory: a library and development workspace where generic, reusable Agent Skills are authored once against the open standard, then installed into other projects with skills.sh. The emphasis is disciplined, portable authoring — no leaked harness assumptions — so a single install works across supported coding-agent harnesses regardless of which one you use.

Browse these skills on skills.sh: [tnttb79/tnttb79-skills](https://www.skills.sh/tnttb79/tnttb79-skills)

## Agent workflow

A lean workflow for building apps with coding agents. Install t-init in your project and run it. It asks what it needs, sets up the context and offers to install the other workflow skills. Then read 0-START-HERE.md, the one-page manual it writes.

```bash
npx skills add tnttb79/tnttb79-skills --skill t-init
```

1. t-design (optional): turn a rough idea into a DESIGN.md in a new repo. It runs before a project exists, so install it with --global.
2. t-init: set up 0-START-HERE.md, AGENTS.md, human-context/, agent-context/ and specs/. Rerun it to tidy.
3. t-spec: agree a feature spec and task list.
4. t-build: build one checked task at a time.
5. t-review: review a feature or the whole app. Fixes come back as a spec for t-build.

The checks and evals for these skills (scripts/check.sh, evals/) stay in this repo and are never installed.

## Installation

List available skills from a GitHub repository:

```bash
npx skills add tnttb79/tnttb79-skills --list
```

Install one skill into the current project:

```bash
npx skills add tnttb79/tnttb79-skills \
  --skill selected-skill
```

Install for selected harnesses:

```bash
npx skills add tnttb79/tnttb79-skills \
  --skill selected-skill \
  --agent claude-code \
  --agent codex \
  --agent cursor
```

Install globally:

```bash
npx skills add tnttb79/tnttb79-skills \
  --skill selected-skill \
  --global
```

Update installed skills:

```bash
npx skills update
```

## Available Skills

| Skill | Description | Install |
|---|---|---|
| `t-design` | Optional step before t-init that interviews you about a rough app idea, researches it, and writes one DESIGN.md with business and technical parts in a new repo. | `npx skills add tnttb79/tnttb79-skills --skill t-design` |
| `t-init` | Sets up or tidies the agent workflow in a repo: the human manual, AGENTS.md, human and agent context, and specs/. | `npx skills add tnttb79/tnttb79-skills --skill t-init` |
| `t-spec` | Turns a feature request into an approved spec with numbered acceptance criteria and a checkable task list. | `npx skills add tnttb79/tnttb79-skills --skill t-spec` |
| `t-build` | Builds an approved spec one task per run and ticks a task only when its check command passes. | `npx skills add tnttb79/tnttb79-skills --skill t-build` |
| `t-review` | Reviews a feature or a whole app in any stack and writes the fixes as a spec for t-build. | `npx skills add tnttb79/tnttb79-skills --skill t-review` |
| `t-walkthrough` | Generates a full set of concise, evidence-based lecture docs (a `lectures/` directory) that teach an unfamiliar codebase from its current source. | `npx skills add tnttb79/tnttb79-skills --skill t-walkthrough` |
