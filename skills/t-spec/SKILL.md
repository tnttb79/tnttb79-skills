---
name: t-spec
description: Turn a feature request into an approved spec and task list in specs/NNN-name/, with numbered acceptance criteria and tasks that each have a check command, after asking the questions it needs. Use when the human asks for t-spec, a spec or a plan for a feature, or says yes after you suggest one for a multi-step request. Also use to change an existing spec. Small fixes do not need it.
---

# t-spec

A spec is a small ticket: what to build, how we know it works, and the tasks to get there. The human approves the spec, then the tasks. t-build does the building.

Templates: [assets/spec.md](assets/spec.md) and [assets/tasks.md](assets/tasks.md).

## When

- The human asks for a spec, or says yes when you suggest one.
- A change that fits one task with an obvious check needs no spec. Say so and offer to just do it.

## 1. Read first

Read AGENTS.md, the index files that match the feature, related specs in specs/ and specs/archive/, and the code the feature touches. Never ask what the repo answers.

## 2. Ask

Ask as many questions as you need, grouped by topic: scope, users and rules, edge cases and errors, security and data, technical. Each question gets one line on why it matters, a suggested answer, and 2 to 4 lettered options. The human can reply "1A, 2C" or "take the suggestions".

- On the problem and the users, the human knows more, so your suggested answer is a guess. Say what it rests on, and leave room for an answer that is not on your list.
- Every gap you do not ask about gets a default under Assumptions, with a reason, so the human's OK covers it.
- Wait for the answers. Ask follow-ups until no criterion rests on a guess.

## 3. Write spec.md

Folder: specs/NNN-name/, where NNN is one more than the highest number in specs/ and specs/archive/, and name is short kebab-case. Fill the spec template:

- Acceptance criteria AC-1, AC-2 and on, each in the form WHEN <trigger> THE SYSTEM SHALL <observable result>, each with a Check line: the test, command or manual step that proves it.
- Non-goals, Assumptions and Open decisions.
- An unanswered point stays inline as [NEEDS CLARIFICATION: question]. No tasks until none remain.

Builder check: re-read the spec as the person who has to build it. If the first task cannot start without a guess, ask once more.

Show the spec and ask for OK. On OK, set Status: approved.

## 4. Write tasks.md

- Small tasks in build order. Each fits one sitting, cites its AC IDs and has a Done when command that exits 0 only when the task works.
- A criterion that can only be checked by hand keeps the manual step on its Check line. Its task's Done when is the nearest command, such as the build.
- The last task is the feature check: one command that exercises all criteria together. Write it now, before any code exists.
- Coverage check: every AC has a task and every task cites an AC. Fix gaps before showing.

Show the tasks and ask for OK. On OK, set Status: approved and tell the human to run t-build.

## Task line format

t-build ticks tasks with a script that reads this exact format, one task per line:

```text
- [ ] T3 (AC-2): Reject expired reset links. Done when: `npm test -- reset-link`
```

The command sits in backticks at the end of the line, after "Done when:", and runs from the repo root.

## Changing a spec

Only t-spec changes a spec. Edit spec.md, then tasks.md: reopen tasks whose criteria changed, add new tasks, and never delete ticked ones. Add a Log line with the date, "spec changed", what and why. Get the human's OK again.
