---
name: t-build
description: Build an approved spec from specs/NNN-name/tasks.md one task per run. A script ticks a task only when its Done when command passes and records the result, and the feature is reviewed, recorded and archived when every task is done. Use when the human asks for t-build, or says build, continue or next task while an approved tasks.md exists in specs/.
---

# t-build

One task per run, then stop so the human can look. A task is done when its command passes, and only the script ticks it.

## Start

1. Run git status and git log --oneline -15.
2. Pick the spec: the specs/ folder the human named, or the only one outside archive/ whose tasks.md has Status: approved. None: suggest t-spec and stop. Several: ask.
3. Read spec.md and tasks.md in full.
4. Check the record. A ticked task with no Log line for it, or with a different command than its Log line, was ticked or edited by hand. Treat it as open and tell the human.
5. Run the project check from AGENTS.md. If it fails, run the ticked tasks' commands. Untick each one that now fails, add a Log line saying why, and fix it before new work.

## Do one task

1. Take the first open task. Load only the context it needs: the AGENTS.md index, then one file.
2. Look up stack docs only on the triggers in AGENTS.md.
3. Write the code and the tests the task calls for.
4. Run the task's Done when command and fix until it passes. After three failed attempts on the same cause, stop with BLOCKED.
5. Tick it with the script in this skill's folder (for example .agents/skills/t-build or .claude/skills/t-build):

   ```bash
   bash <skill folder>/scripts/task-done specs/NNN-name/tasks.md T3
   ```

   It runs the task's command from the repo root. Only on exit 0 does it tick the box and append a Log line with the date, task, short commit (+dirty when there are uncommitted changes) and command. Never tick by hand. If the script cannot run, stop and say so.
6. Run the project check again.
7. Stop. Report the files changed, the check result and the next task. Wait for the human to say continue.

## Rules

- Do not weaken, skip or delete an existing test, or edit a task's text or Done when command, without the human's OK. Log the OK.
- Do not change spec.md, apart from its Status line at feature end. Spec changes go through t-spec.
- New tasks are appended at the end of the list, never inserted or rewritten.
- Commit only if AGENTS.md says the agent commits.
- Log judgement calls as: Decision: what, why, cost if wrong.
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

1. Review. Give a fresh reviewer (a subagent if the harness has one, otherwise a separate pass of your own that starts from the spec) only the acceptance criteria (the findings, for a review spec), the feature diff (git diff from the commit in the first Log line) and the check output. It marks each one met, not met or unverified, with evidence, and says whether the change does what the human meant or only passes the checks. Its pass is a filter, not proof. Each one not met or unverified becomes a new task; tell the human and go back to Do one task.
2. Ask the human to do the manual steps on the AC Check lines.
3. Record lasting facts: new parts, decisions and gotchas in agent-context, with its index updated, and human-context only if what the app does changed. Keep to the size limits in AGENTS.md.
4. Write a three-line Outcome above the Log, set Status: done in spec.md and tasks.md, and move the folder to specs/archive/.
5. Check that every path in AGENTS.md and the index files still exists.
6. Tell the human the feature is done. Suggest t-review for a second look, or t-spec for the next feature.
