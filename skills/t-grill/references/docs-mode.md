# Docs mode

The same interview, plus three jobs: pin down words, record big decisions, check the code. Write the moment something settles. Never save everything at the end, and never write down a question that is still open.

## Where to write

Find the project's context layout first.

- Set up by t-init (AGENTS.md with an Index, and agent-context/):
  - Glossary: agent-context/domains/NNN-glossary.md, with the next free number, plus one line in agent-context/domains/index.md. If a glossary file exists, use it.
  - Decisions: the Decisions section of the agent-context file for the part or area they belong to. If no file fits, ask.
- Any other project: ask once where to put them. Suggest GLOSSARY.md at the root and one short file per decision in docs/adr/, numbered 0001-slug.md.

Create a file only when there is something to write. Keep the glossary within the project's size limits, and split it by area when it grows.

## 1. Pin down words

- Read the glossary, if one exists, before the first round.
- When the human uses a word that clashes with the glossary, say so at once: "The glossary says an order is X, but you seem to mean Y. Which is it?"
- When a word is vague or has two meanings, propose one precise word: "By account, do you mean the customer or the login?"
- Test where one idea ends and another starts with a concrete case: "A customer cancels an order, then places the same order again. One order or two?"
- When the human settles a word, write it to the glossary straight away.

Format:

```markdown
# Glossary

<One sentence: what part of the business these words describe.>

**Order**: A customer's request for items, from checkout until delivery or cancel.
Avoid: purchase, transaction
```

- One word per idea. List the rejected words under Avoid.
- One or two sentences. Say what it is, not what it does.
- Only words specific to this project. Leave out general programming words, even ones the project uses a lot.
- No implementation detail: no table names, paths or code. The glossary is not a spec.
- Group words under subheadings when clusters appear.

## 2. Record big decisions

Record a decision only when all three hold:

1. Hard to undo: changing it later costs real work.
2. Surprising: a later reader would ask why it was done this way.
3. A real trade-off: there were real options and one was picked for a reason.

If any one is missing, skip it. Good cases: a data store or provider that is hard to leave, a scope line ("customers never edit a shipped order"), a deliberate break from the obvious approach, a limit the code cannot show, an option someone will propose again.

Write one or two sentences: what was decided, why, and what was rejected. Follow the format already used where you write it. Tell the human in one line what you recorded, so they can say no.

## 3. Check the code

When the human says how something works, check the code. If it disagrees, say so with the file and line: "orders.ts:42 cancels the whole order, but you said part of an order can be cancelled. Which is right?" The answer may become a glossary word, a decision, or a note that the code is wrong. Do not change code during the session.

## At the end

List the files you changed. Do not commit.
