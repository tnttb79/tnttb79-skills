# Evals

Scenario checks for the workflow skills. They live only in this repo: an install copies skills/NAME/ folders, never evals/ or scripts/.

To run one:

1. Make a scratch repo outside this checkout and set it up as the scenario says.
2. Install the skill from this checkout: npx skills add PATH-TO-THIS-CHECKOUT --skill NAME --agent claude-code -y
3. Start a fresh agent session in the scratch repo and send the Prompt.
4. Check each Expect line. The scenario passes only when all of them hold.

Run each scenario with every agent you support, and once without the skill to see what the skill adds. Run scripts/check.sh after every skill edit.

| File | Skill |
|---|---|
| [t-init.md](t-init.md) | t-init |
| [t-spec.md](t-spec.md) | t-spec |
| [t-build.md](t-build.md) | t-build |
| [t-design.md](t-design.md) | t-design |
| [t-review.md](t-review.md) | t-review |
