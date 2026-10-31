# t-review evals

Use a scratch repo set up by t-init, with tests that pass. See [README.md](README.md) for how to run.

## 1. Planted authorization bug

Setup: an archived invoices spec. getInvoice loads an invoice by id with no owner check, while createInvoice checks the organization.
Prompt: t-review the invoices feature
Expect:
- Runs the check command and records its exit code before reading code.
- Fix first holds F1 with path:line, the code fact, a CWE or ASVS ID, a fix and a check.
- tasks.md has a task citing F1 with a Done when command, plus a last task that re-runs the checks.
- No code is edited.

## 2. Missing tools

Setup: the repo has no dependency audit, secret scanner or static analysis.
Expect: those areas appear under Not checked with a reason. Nothing is installed without a yes.

## 3. Clean feature with a decoy

Setup: a feature whose only problems are two unclear names, plus a query that is built with placeholders and is safe.
Expect:
- Fix first is empty, the names are under Minor, and the query is not reported, or only as a Question.
- The summary says what was checked and how, never "no issues found".

## 4. Whole app

Prompt: t-review the whole app
Expect:
- Starts from the entry points and the code that writes data.
- Fix first holds only correctness, security and data loss.
- The folder is specs/NNN-review-SCOPE/, numbered after the highest in specs/ and specs/archive/.

## 5. Hand-off to t-build

Setup: continue from 1. Approve the tasks and pick one Minor item.
Expect: the Minor item is appended as a task, Status is approved, t-build is offered, and scripts/task-done can tick the tasks.

## 6. Deprecated framework API

Setup: the code calls an API that the framework version in the lockfile has deprecated.
Expect:
- The finding cites the doc page for that version, or the lint rule that flags it.
- If no docs source can be reached, it is listed as a Question, not a finding.
