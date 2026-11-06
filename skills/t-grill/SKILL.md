---
name: t-grill
description: Interview the human about a plan, decision or idea, in rounds, until every open question is settled. The default mode only talks. Docs mode, inside a project, also pins down the project's words in a glossary, records decisions that are hard to undo and flags where the code disagrees. Use when the human says grill me, asks to stress-test or think through a plan or decision, or asks to grill with docs. For a new app idea use t-design, and for a feature ready to build use t-spec.
---

# t-grill

Ask until you and the human share one understanding of the plan. Do not act on the plan until the human confirms it.

## When

- The human wants a plan, decision or idea questioned: a feature, a migration, a choice between options, or something that is not code.
- A new app idea with no repo yet: suggest t-design and ask whether to switch.
- A clear feature the human wants built now: suggest t-spec.

## Mode

- Default: the interview only. Write no files.
- Docs mode: the interview plus the rules in [references/docs-mode.md](references/docs-mode.md). Read that file before the first round.
- Docs mode is on when the human asks for it, for example "grill me with docs" or "save the terms". Inside a project, if the human did not say, ask once at the start: "Should I save terms and decisions as we go?" Outside a project it stays off.

## Who answers what

- Facts are your job. Before you ask, look it up in the code, docs, config or on the web. If your tool can run a helper agent, send long searches there so they do not fill the conversation. Never ask the human what you can find.
- Decisions are the human's. Put each one to them and wait.
- Every question gets your suggested answer, worded so a yes accepts it.
- Problem, users, money, appetite and business rules: the human knows more, so your suggestion is a guess. Say what it rests on. Ask what happened the last time, not what they would do: "Would you use it?" gets a polite yes.
- Technical choices: you know more. Give a suggested answer, a reason, the cost, and 2 to 4 lettered options.

## Rounds

Picture the plan as a tree: each decision opens the decisions that depend on it.

1. Find every question you can ask now: what it depends on is settled, and no lookup it needs is still running.
2. Ask them all in one message, numbered. Hold back a question that depends on another question in the same round.
3. Wait. The human can reply "1A, 3B" or "take the suggestions".
4. Update the tree. Answers open new questions and close branches. Repeat.

```text
1. Who can change an order after it is placed? Suggested: staff only
   Why it matters: decides whether customers need an edit screen at all.
   My guess: the code has no way for customers to edit an order, so staff do it today.

2. What happens to stock when an order changes? Suggested: A
   Why it matters: wrong stock means overselling.
   A) Release and re-reserve at once: simple, small risk of losing the item.
   B) Hold both until the change is confirmed: safe, stock looks lower for a while.
```

- If the human takes every suggestion unchanged, ask which one they are least sure of.
- Say so when an answer conflicts with an earlier answer, the code or a fact you found. Your default is to agree with the human; check it.

## Stop

Stop when no open question would change the plan and nothing rests on a silent guess. Then:

1. Play back the decisions as a short list, in the human's words. Mark anything you assumed.
2. Ask what is wrong or missing, and fix it.
3. On confirmation, offer the next step: t-spec if code will follow, t-design for a new app, or nothing.

The human can stop early. Then list what is settled and what is still open.

Write plainly: short sentences, no emojis, no filler.

Adapted from the grilling and domain-modeling skills in [mattpocock/skills](https://github.com/mattpocock/skills), MIT License, Copyright (c) 2026 Matt Pocock.
