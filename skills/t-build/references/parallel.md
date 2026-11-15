# Parallel work

You are the lead. Helper agents build; you split the work, merge it and keep the context. Helpers cannot talk to each other, so conflicts are prevented when you split and caught when you merge.

## When

- Two or more approved specs whose tasks touch different files and modules. Compare the paths each spec and its tasks name, and the code they will change.
- Overlap in a file, a schema or a shared module: build those specs one after another and say why.
- Never split the tasks of one spec. They build on each other.
- At most three helpers at once.

## Needs

A harness that runs helper agents, each in its own git worktree. Without it, tell the human to open one session per worktree and run t-build there, then say "t-build merge" on the main checkout when they finish.

## Steps

1. Split. For each spec: a branch named after the spec folder, a worktree beside the repo, and the list of paths the helper owns. Specs were written on the main branch, so their numbers do not clash.
2. Set up each worktree with the Parallel section of context/agent/development/agentic-testing.md: files to copy (such as untracked env files), the install command, and how to give it its own port and database. No such section: copy nothing secret by guess; ask.
3. Brief each helper: build this spec with t-build in this worktree, touch only the owned paths, do not edit AGENTS.md, index files, context/human or the backlog, put lasting facts as Lesson lines in the spec's Log, skip the archive step, and report in at most ten lines: tasks ticked, proofs run, review result, BLOCKED items.
4. A helper reports BLOCKED: answer from the spec if it can be answered there. Otherwise bring it to the human with the options.
5. Merge one branch at a time into the main branch. After each merge run every merged feature's proofs and the project check. A failure is fixed before the next merge.
6. Apply each spec's Lesson lines to the context, then archive the spec folders as in feature end.
7. Clean up: remove the worktrees and their branches, and stop anything the helpers left running.
8. Report once, per spec: what was built, proofs, review, and what the agent could not verify.
