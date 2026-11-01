# tnttb79-skills

Agent skills for building an app in small, checked steps. You decide what gets built and approve each step. The agent does the work. They run in Claude Code, Codex, Cursor and other tools that support [Agent Skills](https://agentskills.io).

## How it works

```text
optional        once         repeat for each feature
t-design   ->   t-init   ->   t-spec  ->  t-build  ->  t-review
```

| Skill | You | The agent | You get |
|---|---|---|---|
| `t-design` | answer questions about your idea | researches it and drafts a design | a new repo with a DESIGN.md |
| `t-init` | answer questions, approve the plan | reads the code or DESIGN.md and sets up the project | 0-START-HERE.md, AGENTS.md and context folders |
| `t-spec` | describe a feature, approve the spec and tasks | asks questions and writes the spec | specs/NNN-name/ with spec.md and tasks.md |
| `t-build` | say "continue" and check each change | builds one task and runs its check | working code and a log of passed checks |
| `t-review` | ask for a review and pick what to fix | runs the checks and reviews the code | the fixes as a new spec for t-build |

## Quick start

**You have a project.** In its folder, install t-init and ask your agent to run it:

```bash
npx skills add tnttb79/tnttb79-skills --skill t-init
```

It asks a few questions, shows what it will create, and offers to install t-spec, t-build and t-review. Then open 0-START-HERE.md, the one-page manual it writes for your project.

**You only have an idea.** Install t-design for your user, since it runs before a project exists, and ask your agent to run it:

```bash
npx skills add tnttb79/tnttb79-skills --skill t-design --global
```

It interviews you, creates the repo with a DESIGN.md, and tells you to run t-init there.

## Running a skill

Type its name in your agent chat, for example /t-spec in Claude Code or $t-spec in Codex. Or ask in plain words: "use t-spec to add password reset". t-build also starts when you say "continue" while a spec is in progress.

## What t-init sets up

```text
0-START-HERE.md   the manual for people: commands, your job, where things are
AGENTS.md         the rules every agent reads first (CLAUDE.md points to it)
human-context/    what the app does and how it fits together, in plain words
agent-context/    technical notes, loaded only when a task needs them
specs/            one folder per feature; finished ones move to specs/archive/
```

t-init asks whether these files are shared with your team in git or kept in your clone only.

## Other skills

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
