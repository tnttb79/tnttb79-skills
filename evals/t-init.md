# t-init evals

Install only t-init in the scratch repo. See [README.md](README.md) for how to run.

## 1. Existing repo, no context

Setup: a small Node app. package.json has dev, test and lint scripts, src/ has two modules, one commit.
Prompt: run t-init
Expect:
- Reads package.json and src/ before asking anything.
- Asks grouped, numbered questions with suggested answers, including shared or local, and commits.
- Writes no file before the answers and a yes to the file plan.
- Asks whether to set up agentic testing.
- After the yes: AGENTS.md under 150 lines with commands that match package.json, CLAUDE.md is exactly @AGENTS.md, and context/START-HERE.md, context/human/ and the three context/agent indexes exist. Nothing else of the workflow sits at the root.
- context/specs/backlog.md exists with Next and Later and no items. AGENTS.md has the backlog rule under Workflow and a plain path, not an @ import, in the Index.
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
- context/human/overview.md and context/agent/architecture/index.md use facts from DESIGN.md.
- DESIGN.md ends up at context/specs/archive/000-design.md, with no copy left at the root.

## 4. Local mode

Setup: as in 1. Answer local to the shared or local question.
Expect:
- .git/info/exclude lists AGENTS.md, CLAUDE.md, context/, skills-lock.json and the installed skill folders.
- git status shows none of them, and .gitignore is unchanged.

## 5. Rerun tidies

Setup: a repo set up by t-init. Then delete the file one index entry points to, grow one context/agent file past 200 lines, and install one more skill.
Prompt: run t-init
Expect:
- Reports the dead index entry and the oversized file, and proposes a split.
- Lists the new skill under Utilities in context/START-HERE.md.
- Changes no human-written line without a yes.

## 6. Backlog

Setup: a repo set up by t-init, in a fresh agent session.
Prompt: add to the backlog: let users export their data as CSV
Expect:
- Adds one dated line under Later in context/specs/backlog.md and changes nothing else.
- Starts no work on the item.
- In another fresh session, a task that does not mention the backlog never opens context/specs/backlog.md.
- "Start the CSV export item" reads the backlog, suggests t-spec, and removes the line once the spec exists.

## 7. Shared mode

Setup: as in 1. Answer shared to the shared or local question.
Expect:
- .gitignore does not list the framework files, skills-lock.json or the installed skill folders.
- git status shows those paths, so they can be committed with the project.

## 8. No testing

Setup: as in 1. Answer no to agentic testing.
Expect: no agentic-testing.md exists, and AGENTS.md still lists the project's check command.

## 9. Set up testing later

Setup: a repo set up by t-init without testing, a web app with a dev server.
Prompt: t-init, set up testing. Use Playwright through the real dev server.
Expect:
- Asks only what the repo does not answer: test login, data, fakes, where output goes.
- Shows, then writes context/agent/development/agentic-testing.md under 80 lines, adds it to the development index, and runs one sample proof.
- Tool output points into agent-tmp/ in the git directory, and .gitignore is unchanged.

## 10. Older layout

Setup: a repo with 0-START-HERE.md, human-context/, agent-context/, specs/ and lectures/ at the root, and AGENTS.md pointing to them.
Prompt: run t-init
Expect:
- Shows the moves and waits for a yes.
- After the yes: everything sits under context/, moved with git mv, AGENTS.md and the index files point to the new paths, and archived specs are unchanged.

## 11. Current facts

Setup: a context/agent file says "First we used REST, then the human chose GraphQL, so REST is not allowed."
Prompt: run t-init
Expect: proposes rewriting it as the current fact, such as "Use GraphQL.", and changes it only after a yes.
