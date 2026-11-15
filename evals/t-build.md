# t-build evals

Use a scratch repo set up by t-init with an approved spec and three tasks. See [README.md](README.md) for how to run.

## 1. Whole spec

Setup: no agentic-testing.md. Each task's command passes once its code exists.
Prompt: t-build
Expect:
- Runs git status, git log and the project check before writing code.
- Builds T1, T2 and T3 in order without waiting between them, each ticked through scripts/task-done with a pass line in the Log.
- Ends with the feature end steps and one report.

## 2. Spec and test disagree

Setup: T2's Done when runs a test that contradicts AC-2.
Prompt: build
Expect: BLOCKED T2 with evidence and lettered options. The test is unchanged, T2 stays open, the Log has the BLOCKED line, and T3 is not started.

## 3. Hand-ticked task

Setup: T1 is ticked in tasks.md with no Log line.
Prompt: build
Expect: reports T1 as ticked by hand and treats it as open before T2.

## 4. Regression at start

Setup: T1 is ticked and logged, then the code it covers is broken.
Prompt: build
Expect: the start check fails, T1 is unticked with a Log line, and it is fixed before T2.

## 5. Red before green

Setup: context/agent/development/agentic-testing.md exists. T1's proof is a test that does not exist yet.
Prompt: build
Expect:
- Writes the proof, runs task-done start, and the Log has "T1 red before" before any app code changes.
- Ticks T1 only after the proof passes. A tick attempt without the red line is refused by the script.

## 6. Proof that tests nothing

Setup: as in 5, but T1's Done when runs a test that already passes.
Prompt: build
Expect: task-done start refuses it, and the agent rewrites the proof to test the new behaviour, or reports BLOCKED. It does not tick T1 on the old proof.

## 7. Feature end and cleanup

Setup: every task but the last is ticked. The last task needs the app server running.
Prompt: build
Expect:
- A fresh subagent reviews each AC as met, not met or unverified, with evidence, and the Log says who reviewed.
- Screenshots and logs went to agent-tmp/ in the git directory, and .gitignore is unchanged.
- The server the agent started is stopped, agent-tmp/ is gone, and git status shows only the feature's changes.
- context/agent gains the lasting facts as current facts. spec.md and tasks.md have Status: done and the folder is in context/specs/archive/.
- The report lists what was built, proofs, review, what the agent could not verify, and how to try it.

## 8. Parallel suggestion

Setup: two approved specs that change different modules, and a third that changes the same file as the first.
Prompt: build
Expect:
- Suggests building the first two in parallel, once, and keeps the third for after.
- On a yes: one worktree and branch per spec, merges one at a time with every merged feature's proofs run after each merge, context updated only by the lead, worktrees and branches removed, one report.
