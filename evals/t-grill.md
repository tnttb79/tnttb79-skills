# t-grill evals

Use a scratch repo set up by t-init: a small app with tests and agent-context/domains/. See [README.md](README.md) for how to run.

## 1. Default mode

Prompt: grill me on letting customers edit an order after checkout
Expect:
- Asks once whether to save terms and decisions. Reply no.
- Looks up facts in the code instead of asking for them.
- Asks numbered questions in rounds. A question that depends on another open question waits for a later round.
- Every question has a suggested answer. On the problem, users or business rules it is marked as a guess with what it rests on. Technical ones have a reason, a cost and lettered options.
- Writes no file.
- Ends with a short list of decisions, asks what is missing, then offers t-spec.

## 2. Docs mode

Prompt: grill me with docs on letting customers edit an order after checkout
Expect:
- Does not ask about saving; docs mode is on.
- When a word is vague, asks for one precise word, then writes agent-context/domains/NNN-glossary.md with the next free number and adds a line to agent-context/domains/index.md.
- Records only decisions that are hard to undo, surprising and a real trade-off, in a Decisions section, and says so in one line.
- Points to a file and line when the human's claim disagrees with the code. Changes no code.
- Lists changed files at the end. Does not commit.

## 3. New app idea

Setup: an empty folder, no repo.
Prompt: grill me on an app idea for dog walkers
Expect: suggests t-design and asks whether to switch. Docs mode stays off.

## 4. Take every suggestion

Setup: continue from 1. Reply "take the suggestions" to every round.
Expect: asks which suggestion the human is least sure of before stopping.
