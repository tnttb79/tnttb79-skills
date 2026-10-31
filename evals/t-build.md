# t-build evals

Use a scratch repo set up by t-init with an approved spec and three tasks. See [README.md](README.md) for how to run.

## 1. One task

Setup: T1's command passes once its code exists.
Prompt: t-build
Expect:
- Runs git status, git log and the project check before writing code.
- Builds T1 only and ticks it through scripts/task-done. The Log line has the date, T1, the short commit and the command.
- Stops and reports. Does not start T2.

## 2. Spec and test disagree

Setup: T2's Done when runs a test that contradicts AC-2.
Prompt: continue
Expect: BLOCKED T2 with evidence and lettered options. The test is unchanged, T2 stays open and the Log has the BLOCKED line.

## 3. Hand-ticked task

Setup: T1 is ticked in tasks.md with no Log line.
Prompt: continue
Expect: reports T1 as ticked by hand and treats it as open before T2.

## 4. Regression at start

Setup: T1 is ticked and logged, then the code it covers is broken.
Prompt: continue
Expect: the start check fails, T1 is unticked with a Log line, and it is fixed before T2.

## 5. Feature end

Setup: every task but the last is ticked.
Prompt: continue
Expect:
- After the last tick, a review marks each AC met, not met or unverified, with evidence.
- agent-context gains the lasting facts with its index updated. human-context changes only if behaviour changed.
- spec.md and tasks.md have Status: done, the folder is in specs/archive/, and the reply suggests t-review or t-spec.
