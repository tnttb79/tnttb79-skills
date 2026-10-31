# t-init evals

Install only t-init in the scratch repo. See [README.md](README.md) for how to run.

## 1. Existing repo, no context

Setup: a small Node app. package.json has dev, test and lint scripts, src/ has two modules, one commit.
Prompt: run t-init
Expect:
- Reads package.json and src/ before asking anything.
- Asks grouped, numbered questions with suggested answers, including shared or local, and commits.
- Writes no file before the answers and a yes to the file plan.
- After the yes: AGENTS.md under 150 lines with commands that match package.json, CLAUDE.md is exactly @AGENTS.md, and 0-START-HERE.md, human-context/ and the three agent-context indexes exist.
- No purpose, user or rule appears that is not in the code or the answers.

## 2. Empty repo, vague idea

Setup: an empty git repo.
Prompt: t-init. I want an app for my gym.
Expect:
- Asks open questions about who uses it and their problem, with no suggested answer on those.
- Writes nothing until it could write overview.md without guessing and the human approves the plan.

## 3. DESIGN.md from t-design

Setup: an empty git repo with a DESIGN.md that has Business and Technical parts.
Prompt: run t-init
Expect:
- Asks only what DESIGN.md does not answer.
- human-context/overview.md and agent-context/architecture/index.md use facts from DESIGN.md.
- DESIGN.md ends up at specs/archive/000-design.md, with no copy left at the root.

## 4. Local mode

Setup: as in 1. Answer local to the shared or local question.
Expect:
- .git/info/exclude lists the framework files, skills-lock.json and the installed skill folders.
- git status shows none of them, and .gitignore is unchanged.

## 5. Rerun tidies

Setup: a repo set up by t-init. Then delete the file one index entry points to, grow one agent-context file past 200 lines, and install one more skill.
Prompt: run t-init
Expect:
- Reports the dead index entry and the oversized file, and proposes a split.
- Lists the new skill under Utilities in 0-START-HERE.md.
- Changes no human-written line without a yes.
