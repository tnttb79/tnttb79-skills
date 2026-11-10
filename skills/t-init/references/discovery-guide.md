# Discovery guide

Ask until the context can be written without guessing. Never ask what the repo or the human already answered.

## Question format

Group questions by topic and number them. Each question has one line on why it matters, a suggested answer, and 2 to 4 lettered options with their consequence. The human can reply "1A, 2C" or "take the suggestions".

```text
2. Shared or local context?
   Why: decides whether teammates and future clones see the specs, context and installed skills.
   Suggested: A
   A) Shared: commit the framework files and installed skills. Everyone works from the same context.
   B) Local: list them in .git/info/exclude. Only this clone has them, with no history.
```

## Confirm what you found

For an existing repo, state what you inferred and ask for a yes or a correction. Do not make the human repeat what the code shows.

```text
1. From the code this is a booking app for small clinics, with staff and patient roles. Right?
   A) Yes
   B) Partly: tell me what differs
```

## Do not lead on purpose and users

When the purpose, the users or their problem are unclear, ask open questions with no suggested answer, about real past events: "Who will use this first, and how do they handle it today?" A suggestion there plants your idea in the answer. Offer suggestions for choices the human may have no view on, such as hosting, libraries or folder layout.

## What to cover

Skip anything already clear.

- Purpose, first users and the problem they have today.
- Main flows and business rules: who can do what, limits, money, time, states.
- First milestone and what is out of scope (new repos).
- Stack (new repos): suggest well-known options, each with a reason.
- Shared or local, commits, protected areas, approvals.
- The check command, if none exists.
- Tricky areas the human already knows about.

## When to stop

Stop when you can write overview.md and AGENTS.md without guessing, and every remaining unknown is an assumption or open decision the human has seen. Accept "not decided" and "agent may choose". Record each open item in the file it affects.
