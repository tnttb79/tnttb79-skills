---
name: t-init
description: Set up or tidy the agent workflow in a repository. Creates AGENTS.md, CLAUDE.md and one context/ folder (START-HERE.md for humans, human/, agent/, specs/) from existing code or from a new app described in a prompt, a file or a DESIGN.md from t-design, after asking the questions it needs. Offers agentic testing, which writes agentic-testing.md from the human's instructions so agents prove their own work. Moves an older layout into context/. Rerun it to tidy context or to set up testing later. Run only when the human asks for t-init, workflow setup, testing setup or a context tidy.
---

# t-init

Set up the workflow once, then keep it tidy. Humans start at context/START-HERE.md. Agents read AGENTS.md and load the rest on demand.

Before asking questions, read [references/discovery-guide.md](references/discovery-guide.md). Before writing context, read [references/context-guide.md](references/context-guide.md). File templates are in [assets/templates.md](assets/templates.md).

## What it sets up

```text
AGENTS.md            agent map: commands, stack, workflow, rules, writing rules, index
CLAUDE.md            one line: @AGENTS.md
context/
  START-HERE.md      human manual: commands, your job, where things are
  human/             overview.md, architecture.md: plain words for people
  agent/             architecture/, development/, domains/: index.md plus 001-name.md files
  specs/             one folder per feature, archive/ for finished ones, backlog.md
```

AGENTS.md and CLAUDE.md stay at the root, because agent tools read them there. Everything else of the workflow lives in context/.

## Rules

- Facts come from the human, the code and the config. Never invent purpose, users, rules, commands or versions. A guess is an assumption until the human confirms it.
- Show the file plan before writing. Install nothing without a yes.
- Keep human-written instructions. Merge them and report conflicts.
- No secrets or literal environment values. Name variables only.
- Write current facts. When a fact changes, replace the old line; history lives in git and spec logs.
- Keep to the size limits in the context guide.

## 1. Find the situation

- context/START-HERE.md and context/agent/ exist: rerun. Go to Tidy, or to Testing if the human asked for it.
- 0-START-HERE.md, human-context/, agent-context/ or a root specs/ exist: older layout. Go to Move, then Tidy.
- The repo has code: existing repo, step 2a.
- The repo is empty: new repo, step 2b.
- A DESIGN.md at the root (from t-design) is a main source either way.
- Not a git repo: ask before running git init.

## 2a. Existing repo: analyse before asking

Read only as far as needed, in this order: README and docs, manifests and lockfiles, entry points, config and CI, tests, then git log --oneline -50 and the most-changed files. Read existing AGENTS.md, CLAUDE.md, .cursor/rules and similar files in full. Their valid rules carry over.

Collect what the app does and for whom, the main parts and how they connect, data stores, outside services, stack and versions, the exact install, run and check commands, the test tools already set up, the conventions the code follows, and tricky areas: complex rules, repeated bug fixes, surprising behaviour.

## 2b. New repo: get the idea

Ask the human to describe what they are building, in any form: a prompt, a file, a link. Read DESIGN.md if there is one. Keep asking until you could write context/human/overview.md without guessing.

## 3. Ask

Ask as many questions as you need, in the format of the discovery guide. Always settle:

- Shared or local. Shared (suggested): framework files and installed skills are committed, so the team and future clones share them. Local: they go in .git/info/exclude; only this clone has them, with no history.
- Commits: the agent commits after each finished task, or only the human commits.
- Areas agents must not touch, and changes that need the human's approval.
- Agentic testing: set it up now, or not. See Testing. No means no agentic-testing.md, and agents work without required proofs.

Wait for the answers.

## 4. Show the plan

List every file you will create or change, with one line on what goes in it, and the Stack table. Ask to proceed. Wait.

## 5. Write

Fill the templates with facts. Leave out any section you have nothing true to put in.

- context/human/: short, plain words, no code.
- context/agent/: start small. architecture/index.md opens with the system map. development/ gets 001-setup.md and 002-conventions.md. domains/ gets one numbered file per tricky area, each with Gotchas.
- AGENTS.md: list only commands found in config or docs. Run the check command once and report the result. If there is no single check command, propose one and add it only after a yes.
- CLAUDE.md: the line @AGENTS.md, not inside code formatting. If CLAUDE.md has other content, move the shared parts into AGENTS.md and keep Claude-only parts below the import.
- DESIGN.md: fold its facts into context/human and context/agent, then move it to context/specs/archive/000-design.md.
- Create context/specs/archive/, and context/specs/backlog.md from its template with no items.

## 6. Stack docs

One Stack row per main stack: name, version from the lockfile, one docs source and its check command. The docs source is the first of these that exists:

1. Version-matched docs inside the installed package, for example node_modules/next/dist/docs.
2. The vendor's official docs tool or MCP server.
3. Context7 (ctx7 CLI or MCP server), with the library ID pinned to the version.

Install no docs tool without a yes. Keep the lookup rule from the AGENTS.md template as written.

## 7. Install the workflow skills

Ask, then install t-spec, t-build and t-review from the source t-init came from (see skills-lock.json), for example:

```bash
npx skills add tnttb79/tnttb79-skills --skill t-spec --skill t-build --skill t-review
```

If it fails, print the command for the human to run. Under Utilities in context/START-HERE.md, list every other installed skill, one line each from its description. Go by the skill folders, such as .agents/skills/NAME: skills-lock.json can still list removed skills.

## 8. Git

- Shared: framework files, skills-lock.json and the installed skill folders stay tracked (.agents/skills/NAME, .claude/skills/NAME and similar). Do not add them to .gitignore. If an earlier run ignored those folders, remove those lines so the skills travel with the repo.
- Local: add AGENTS.md, CLAUDE.md, context/, skills-lock.json and the installed skill folders to .git/info/exclude. Leave .gitignore alone.

Never commit unless the human asks.

## Testing

Agentic testing means each acceptance criterion gets a proof the agent runs itself: a short test that drives the real app and fails before the work, passes after. It is on when context/agent/development/agentic-testing.md exists, and off when it does not.

1. Ask how the human wants agents to test their work. Suggest the standard tool for the stack and any tool already in the repo, with a reason, for example a browser test runner for a web app, HTTP tests against the running server for an API, an emulator flow runner for mobile, the command itself for a CLI. The human's instructions win.
2. Find out, from the repo and the human: how to start the app for a test, test data and test logins, fakes for outside services, how to run one proof, where test tools write their output, browser or screen tools agents may use to look at the app, and, for parallel work, what a new worktree needs (files to copy, install, its own port and database).
3. Show the file, then write it from the template, under 80 lines. Add its line to context/agent/development/index.md.
4. Point tool output (reports, screenshots) to the git directory's agent-tmp/ where the tool allows, so nothing new goes in .gitignore.
5. Run one existing test or a tiny sample proof the way the file says, and report the result.
6. An approved spec with open tasks: offer to rewrite its open tasks' Done when lines as proofs through t-spec.

## Move (older layout)

Show the moves, then on a yes, with git mv where tracked:

- 0-START-HERE.md to context/START-HERE.md
- human-context/ to context/human/, agent-context/ to context/agent/
- specs/ to context/specs/, lectures/ to context/lectures/
- agent-context/development/NNN-checking-work.md stays as a numbered file; it does not turn testing on.

Then rewrite every old path in AGENTS.md, CLAUDE.md, context/ and other docs that name them. Leave archived specs as they are: their logs are history. Report what moved.

## Tidy (rerun)

1. Refresh the command and Utilities lists in context/START-HERE.md from the installed skills.
2. Check every path in AGENTS.md and in each index.md. Fix or remove dead entries.
3. Flag files over the size limits and propose a split.
4. Read git log since the context last changed. Flag stale facts and missing gotchas, propose fixes, and apply them after a yes. Rewrite history-style lines ("first X, then the human chose Y") as the current fact.
5. Move specs with Status: done to context/specs/archive/.
6. If context/specs/backlog.md is missing, offer to add it with its AGENTS.md and START-HERE.md lines. If it exists, list items that a finished spec already covers and remove them after a yes.
7. If the framework files are tracked, the project is shared: installed skill folders stay tracked. If .gitignore lists them, remove those lines after a yes. If the framework files are in .git/info/exclude, leave that list as it is.

Change nothing the human wrote without a yes.

## Report

Files created, moved or changed, questions asked, commands checked or not run, whether agentic testing is on, open decisions, and the next step: read context/START-HERE.md, then run t-spec for the first feature.
