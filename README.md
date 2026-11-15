# tnttb79-skills

Agent skills for building an app in small, proven steps. You decide what gets built and approve the plan. The agent builds it end to end and proves its own work. They run in Claude Code, Codex, Cursor and other tools that support [Agent Skills](https://agentskills.io).

## How it works

```text
optional        once         repeat for each feature
t-design   ->   t-init   ->   t-spec  ->  t-build  ->  t-review
```

| Skill | You | The agent | You get |
|---|---|---|---|
| `t-design` | answer questions about your idea | researches it and drafts a design | a new repo with a DESIGN.md |
| `t-init` | answer questions, approve the plan, say how agents should test (optional) | reads the code or DESIGN.md and sets up the project | AGENTS.md and one context/ folder |
| `t-spec` | describe a feature, approve the spec and tasks | asks questions and writes the spec | context/specs/NNN-name/ with spec.md and tasks.md |
| `t-build` | say "build" | builds every task, proves each one, gets a fresh review and cleans up | working code, a log of passed checks and a short report |
| `t-review` | ask for a review and pick what to fix | runs the checks and reviews the code | the fixes as a new spec for t-build |

## Quick start

**You have a project.** In its folder, install t-init and ask your agent to run it:

```bash
npx skills add tnttb79/tnttb79-skills --skill t-init
```

It asks a few questions, shows what it will create, and offers to install t-spec, t-build and t-review. Then open context/START-HERE.md, the one-page manual it writes for your project.

**You only have an idea.** Install t-design for your user, since it runs before a project exists, and ask your agent to run it:

```bash
npx skills add tnttb79/tnttb79-skills --skill t-design --global
```

It interviews you, creates the repo with a DESIGN.md, and tells you to run t-init there.

## Running a skill

Type its name in your agent chat, for example /t-spec in Claude Code or $t-spec in Codex. Or ask in plain words: "use t-spec to add password reset". t-build also starts when you say "build" or "continue" while a spec is approved.

## What t-init sets up

```text
AGENTS.md            the rules every agent reads first (CLAUDE.md points to it)
context/
  START-HERE.md      the manual for people: commands, your job, where things are
  human/             what the app does and how it fits together, in plain words
  agent/             technical notes, loaded only when a task needs them
  specs/             one folder per feature; finished ones move to archive/;
                     backlog.md holds ideas and todos for later
```

t-init asks whether these files are shared with your team in git or kept in your clone only. A repo with the older layout (0-START-HERE.md, human-context/, agent-context/, specs/) is moved into context/ on the next t-init run.

## Agentic testing

Optional. When you set it up with t-init, you say how agents should test, and t-init writes context/agent/development/agentic-testing.md. From then on every acceptance criterion gets a short proof that drives the running app: a browser test for a web app, HTTP calls for an API, an emulator flow for mobile, the command itself for a CLI. The t-build script ticks a task only after its proof failed before the work and passes after. Without the file, agents work as usual with the project's own checks.

## Other skills

- `t-grill`: interviews you about a plan or decision until nothing is left open. With docs, it also keeps a glossary of the project's words and records big decisions.
- `t-walkthrough`: writes lecture-style docs that teach an unfamiliar codebase.

Install any skill by name with `npx skills add tnttb79/tnttb79-skills --skill NAME`, or browse them on [skills.sh](https://www.skills.sh/tnttb79/tnttb79-skills).

## Install options

| To | Run or add |
|---|---|
| list every skill in this repo | `npx skills add tnttb79/tnttb79-skills --list` |
| install for some agents only | `--agent claude-code --agent codex --agent cursor` |
| install for your user, not one project | `--global` |
| update installed skills | `npx skills update` |

## Working on these skills

This repo is where the skills are written and tested. Each skill is a folder in skills/ with a SKILL.md and optional references/, assets/ and scripts/. AGENTS.md has the authoring rules.

Run the checks before committing:

```bash
bash scripts/check.sh
```

evals/ has test scenarios for each workflow skill. scripts/ and evals/ stay in this repo and are never installed into projects.
