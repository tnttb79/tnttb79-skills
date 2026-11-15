---
name: t-build
description: Build an approved spec from context/specs/NNN-name/tasks.md end to end. A script ticks a task only when its Done when command passes and logs the result; with agentic testing set up, each proof must fail before the work and pass after. At the end a fresh reviewer checks the criteria, lessons are recorded, temporary files and processes are cleaned up and the spec is archived. Can split independent specs across parallel helper agents. Use when the human asks for t-build, or says build, continue or next while an approved tasks.md exists in context/specs/.
---

# t-build

Build the whole spec, then report. A task is done when its command passes, and only the script ticks it. Stop early only for BLOCKED or an approval the spec does not cover.

## Start

1. Run git status and git log --oneline -15.
2. Pick the spec: the folder the human named, or the only one in context/specs/ outside archive/ whose tasks.md has Status: approved. None: suggest t-spec and stop. Several: ask which, or offer parallel work (below).
3. Read spec.md and tasks.md in full. Read context/agent/development/agentic-testing.md if it exists: it says how to run and drive the app.
4. Check the record. A ticked task with no pass line in the Log, or with a different command than its Log line, was ticked or edited by hand. Treat it as open and tell the human.
5. Run the project check from AGENTS.md. If it fails, run the ticked tasks' commands. Untick each one that now fails, add a Log line saying why, and fix it before new work.

## Each task, in order

1. Take the first open task. Load only the context it needs: the AGENTS.md index, then one file.
2. With agentic testing: write the proof first, as agentic-testing.md says, then run `task-done start`. It must fail (red). A task tagged refactor must pass instead. If a new proof passes before any work, it tests nothing new: rewrite it.
3. Write the code. Look up stack docs only on the triggers in AGENTS.md. For UI work, look at the running app with a browser or screen tool if agentic-testing.md lists one, to find elements and to check the screen looks right. A look never replaces the proof.
4. Run the task's Done when command and fix until it passes. After three failed attempts on the same cause, stop with BLOCKED.
5. Tick it with the script in this skill's folder (for example .agents/skills/t-build or .claude/skills/t-build):

   ```bash
   bash <skill folder>/scripts/task-done start context/specs/NNN-name/tasks.md T3   # agentic testing only, before the code
   bash <skill folder>/scripts/task-done context/specs/NNN-name/tasks.md T3
   ```

   The script runs the command from the repo root. Only on exit 0 does it tick the box and log the date, task, short commit and command. With agentic testing it refuses to tick a task that has no red line (green for refactor) for the same command. Never tick by hand. If the script cannot run, stop and say so.
6. Commit if AGENTS.md says the agent commits. Go to the next task without waiting.

## Rules

- Do not weaken, skip or delete an existing test, or edit a task's text or Done when command, without the human's OK. Log the OK.
- Do not change spec.md, apart from its Status line at feature end. Spec changes go through t-spec.
- New tasks are appended at the end of the list, never inserted or rewritten.
- Approvals listed in AGENTS.md (libraries, schema, money, pushing and the like) are covered when the spec's Approvals line names them. Anything else on that list: stop and ask.
- Log judgement calls as: Decision: what, why, cost if wrong.
- Temporary files (screenshots, logs, scratch scripts, tool output) go in agent-tmp/ inside the git directory: `"$(git rev-parse --git-dir)/agent-tmp"`. Git never tracks it, so nothing goes in .gitignore. Note every process you start (servers, emulators, containers) so you can stop it.
- Stopping mid-task: add a Log line with what is done and what remains.

## BLOCKED

Stop and leave the task open when the spec, a test and a check disagree, when a check cannot pass honestly, or when a decision is missing. Write:

```text
BLOCKED T3: <the conflict, one line>
Evidence: <file:line or command output>
A) <option and its cost>
B) <option and its cost>
Suggested: <letter, and why>
```

Add the first line to the Log and wait for the human's pick.

## Feature end

When every task is ticked:

1. Review. Give a fresh reviewer only the acceptance criteria (the findings, for a review spec), the feature diff (git diff from the commit in the first Log line), the diff of test files since the proofs were written, and the check output. Use a subagent when the harness has one; a pass of your own that starts from the spec is the fallback only when it has none. The reviewer marks each criterion met, not met or unverified, with evidence, flags any proof that was weakened or tests nothing real, and says whether the change does what the human meant or only passes the checks. Log the result and who reviewed. Each finding not met becomes a new task: build it, then review again.
2. Manual Check lines: do each one you can with the app and your tools, and log the result. List the rest in the report as not verified by the agent. They do not block the feature.
3. Record lasting facts. Prefer a check over prose: a gotcha that a lint rule or test can catch becomes that rule or test. The rest goes into context/agent with its index updated, and context/human only if what the app does changed. Write current facts, replacing what they supersede. Keep to the size limits in AGENTS.md.
4. Clean up: stop every process you started, delete the agent-tmp folder and any tool output the run left in the repo, and run git status. Only the feature's own changes may remain. Never stop a process or delete a file you did not create.
5. Write a three-line Outcome above the Log, set Status: done in spec.md and tasks.md, and move the folder to context/specs/archive/.
6. Check that every path in AGENTS.md and the index files still exists.
7. Report: what was built, the proofs that passed, the review result, what the agent could not verify, and one line on how to try it.

## Parallel work

When two or more approved specs touch different parts of the code, suggest building them in parallel, once per set of specs. Do it only on a yes or when the human asks for helper agents. Read [references/parallel.md](references/parallel.md) first.
