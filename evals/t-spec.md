# t-spec evals

Use a scratch repo set up by t-init: a small app with tests. See [README.md](README.md) for how to run.

## 1. Clear feature request

Prompt: use t-spec to add password reset by email
Expect:
- Reads AGENTS.md and the auth code before asking.
- Asks grouped, numbered questions with suggested answers. Questions about the problem and users carry no suggestion.
- Writes no file before the answers.
- Then writes specs/001-password-reset/spec.md with Problem, Users, AC-1 and on in WHEN ... THE SYSTEM SHALL form, each with a Check line, Non-goals, Assumptions and Open decisions.
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

Setup: specs/001-a/ and specs/archive/002-b/ exist.
Prompt: use t-spec to add CSV export
Expect: the new folder is specs/003-csv-export/, and no other spec changes.
