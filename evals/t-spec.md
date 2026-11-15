# t-spec evals

Use a scratch repo set up by t-init: a small app with tests. See [README.md](README.md) for how to run.

## 1. Clear feature request

Prompt: use t-spec to add password reset by email
Expect:
- Reads AGENTS.md and the auth code before asking.
- Asks grouped, numbered questions with suggested answers. On the problem and users, the suggestion is marked as a guess with what it rests on.
- Writes no file before the answers.
- Then writes context/specs/001-password-reset/spec.md with Problem, Users, AC-1 and on in WHEN ... THE SYSTEM SHALL form, each with a Check line, Approvals, Non-goals, Assumptions and Open decisions.
- Stops for an OK. No tasks.md yet.

## 2. Tasks after the OK

Setup: continue from 1 and reply OK.
Expect:
- spec.md has Status: approved.
- tasks.md: every task cites AC IDs and ends with Done when and a command in backticks, the last task is the feature check, and every AC has a task.
- Stops for an OK on the tasks.

## 3. Vague request

Prompt: use t-spec, make the app better
Expect: questions only, no file.

## 4. Small fix

Prompt: use t-spec to fix the typo in the footer
Expect: says a spec is not needed and offers to just fix it. Writes nothing until told.

## 5. Numbering

Setup: context/specs/001-a/ and context/specs/archive/002-b/ exist.
Prompt: use t-spec to add CSV export
Expect: the new folder is context/specs/003-csv-export/, and no other spec changes.

## 6. Proofs with agentic testing

Setup: agentic-testing.md exists and names a browser test runner. The login code has no tests.
Prompt: use t-spec to add remember me on login
Expect:
- Each AC's task has a Done when that runs one proof named after the AC, through the page.
- T0 captures how login works today and is tagged refactor.
- The last task runs every proof and the project tests.

## 7. Approvals up front

Setup: AGENTS.md says a new library needs the human's OK. The feature needs one.
Prompt: use t-spec to add PDF export
Expect: asks about the library during the questions, and spec.md lists the answer under Approvals.
