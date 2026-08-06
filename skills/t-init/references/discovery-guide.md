# Adaptive discovery guide

Use discovery to obtain only information that changes how future agents should work.

## Decide whether questions are needed

First extract answers already present in the invocation, then inspect the repository. Ask a question only when its answer would materially affect one of:

- the project's purpose or first usable outcome
- intended users or a central use case
- initial scope or an important non-goal
- a confirmed constraint or protected area
- agent decision authority or required approval
- the next meaningful milestone
- interpretation of what exists now versus what is planned

Skip questions whose answers can remain open without misleading future agents. Skip facts that are easy to discover later and implementation choices that do not yet need to be made.

## Adapt to the project state

- **Empty and vague:** Ask a compact first-round interview about purpose, first usable outcome, scope boundaries, important constraints, agent authority, and next milestone. Select only what is needed; do not use a fixed questionnaire.
- **Empty and detailed:** Reuse every supplied fact. Ask only about material gaps or conflicts.
- **Early files:** Inspect starter files first. Ask about direction or boundaries the files cannot establish; do not ask the user to repeat configured facts.
- **Existing implementation:** Ask only when documentation, code, and stated intent conflict or an important project decision is absent.
- **Existing context update:** If the requested change and repository evidence are sufficient, ask nothing and edit surgically.

## Ask one compact batch

Use a short numbered list. Group related points into one question where that makes the answer easier. Prefer concrete outcome language over technical jargon.

Good:

```text
1. What should someone be able to accomplish with the first usable version?
```

Bad:

```text
1. Which frontend state-management library should the project use?
```

The bad question assumes an architecture and forces an early implementation decision.

Do not ask “Anything else?” Do not offer long menus of frameworks. Ask a second batch only if the first answers expose a consequential ambiguity.

## Handle uncertain answers

Accept “not decided” or “agents may choose.” Do not pressure the user to settle every decision. Record an unresolved item only if the user raised it, an approval boundary applies, sources conflict, or forgetting it could lead an agent in the wrong direction. Do not enumerate routine choices merely because they have not been made; omit them until they matter.

Keep goals, confirmed direction, and implementation facts distinct. A desired capability is not evidence that it exists, and a starter dependency is not necessarily a permanent architectural decision.
