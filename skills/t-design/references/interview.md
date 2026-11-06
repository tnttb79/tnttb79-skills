# Interview guide

## Who knows what

| Topic | Who knows more | How to ask |
|---|---|---|
| Problem, users, money, appetite, business rules | the human | your guess, marked as a guess, with what it rests on |
| Hosting, framework, database, auth | you | suggested answer, reason, cost, lettered options |
| Competitors, regulations, limits, prices | neither | research, then report with sources |

Every question carries a suggested answer, worded so a yes accepts it. That keeps the interview fast, but offered answers pull people toward them. On the human's own ground, say your suggestion is a guess and what it rests on, and leave room for an answer that is not on your list.

## Questions by stage

Story, one question per message, each with your guess, following up on each answer:

1. Tell me about the last time you, or someone you watched, hit this problem. What happened, step by step?
2. What did they do about it, and what do they use today?
3. What did it cost them in time, money or mistakes?
4. When did they first think there must be a better way? What happened just before?
5. What have they tried, and why did they stop or stay?
6. Has anyone offered to pay, test an early version or introduce you to others?

For example:

```text
Tell me about the last time a walker lost track of a booking.
My guess, from what you said: a double booking, because requests come by text and by app. Yes, or what happened?
```

Scope and rules, in batches of 3 to 5, each with a suggested answer:

7. Who pays, and who uses it?
8. How much of your time will you spend before the first version is in someone's hands?
9. What must the first version let one person do from start to finish?
10. What will it not do, even if someone asks?
11. Which rules must the app enforce, such as who can see or change what?
12. Will it store personal data, take payments, or touch health, children's or location data?

Technical, one batch with suggestions, for example:

```text
13. Where should it run? Suggested: A
    A) A managed platform: no servers to patch, cost grows with use.
    B) A small rented server: cheaper later, you patch it.
    C) Your own machine: free, but no outside users.
```

Premortem and playback:

14. Imagine it is a year after launch and the app has failed. What is the most likely reason?
15. Here is what I heard, in your words. What is wrong or missing?

## Leading questions to avoid

- "Would you use an app that reminds clients to pay?" A future yes. People answer as their ideal selves, and to be nice.
- "Your users are busy freelancers, right?" with nothing behind it. A guess must say what it rests on, so the human can see when it is thin.
- "What matters most: A speed, B price, C ease of use? Suggested: C." with no way out. Always leave room for an answer not on the list.
- "How often does this problem happen?" People summarise their own behaviour badly. Ask for the last time.
- "Tool X has no offline mode. Is that the gap you fill?" A solution frame before the story.

## When to stop

Stop when each Business section holds a past story, a sourced fact or a labelled assumption, and no open answer would change the scope, the data model or milestone 1. The human is one case, not the market: their claims about other people stay [A] until real users confirm them.
