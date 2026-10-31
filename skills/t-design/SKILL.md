---
name: t-design
description: Turn a rough app idea into one DESIGN.md with a business part and a technical part, in a new git repo, before t-init. Interviews the human about real past events, researches alternatives, rules and feasibility with sources opened in the session, then settles scope and stack. Offers Quick or Deep research. Use when someone has an app idea that is not clear yet, or asks for t-design, a business plan or a technical design for a new app.
---

# t-design

Optional, before t-init. Turns a vague idea into a short, checked DESIGN.md in a new repo. t-init then builds the project context from it.

Read [references/interview.md](references/interview.md) before asking and [references/research.md](references/research.md) before researching. Template: [assets/DESIGN.md](assets/DESIGN.md).

## Rules

- The human knows the problem, the users, the money and the appetite: ask openly, with no suggested answer. You know more about hosting, frameworks, databases and auth: suggest, with a reason and a cost. Neither of you knows competitors, rules, limits or prices: research them.
- Ask about past events, never about future use. "Would you use it?" gets a polite yes.
- Cite only pages you opened this session, and copy figures from the page.
- Label every claim: [S1] a source, [H] the human said it, [A] an assumption, [E] an estimate with its formula. "Unknown" beats a filled gap.
- Look for evidence against the idea. Your default is to agree with the human.
- Write plainly: no em dashes, no emojis, no filler words, short sentences.

## 1. Idea and depth

Ask: "What do you want to build, and who is it for? A sentence or two is fine." Then recommend a depth, with a reason, and let the human pick:

- Quick: personal or internal tools, no money or sensitive data, cheap to be wrong. About 20 to 30 minutes, 6 to 12 sources, DESIGN.md within 150 lines.
- Deep: public users, payments, personal or regulated data, a crowded market, or months of work at stake. About 60 to 120 minutes, 15 to 30 sources, DESIGN.md within 250 lines.

## 2. The story

Open questions, one per message, with no suggestions and no competitor names. Get the last time the problem happened, what people do today, what it costs and what they tried. The questions are in the interview guide.

## 3. Research

No questions in this stage. Follow the research guide for the chosen depth: alternatives, rules that apply, technical feasibility and evidence against.

## 4. Scope and rules

One or two batches of 3 to 5 questions: who pays and who uses it, the appetite, what the first version must do end to end, what it will not do, the rules the app must enforce, and sensitive data. Offer options only when they come from the human's own words or from research.

## 5. Technical choices

One batch of 3 to 5 decisions, such as hosting, stack, data store and auth. Each has a suggested answer, a reason, a cost and lettered options. Prefer well-known technology and spend at most one new technology, named. If the human takes every suggestion unchanged, ask which one they are least sure of.

## 6. Premortem and playback

Ask: "Imagine it is a year after launch and the app has failed. What is the most likely reason?" Then play back what you heard, in their words, and ask what is wrong or missing.

## 7. Repo and DESIGN.md

1. Ask where to create the repo, suggesting a folder named after the app. Run git init there. Do not commit.
2. Write DESIGN.md at its root from the template, with Status: draft.
3. Run the checks below and fix what fails.
4. Show a short summary and the file path. Apply the human's corrections, then set Status: agreed.

## Checks before showing

- Swap test: put another app's name in. A sentence that still holds is generic; cut or sharpen it.
- Every [S#] was opened this session and its figure is on the page. Every number has [S#], [H] or [E] with a formula. No market size unless asked.
- A1 and A2 are in the human's words. Your ideas are marked [A] and listed in A6.
- A8 holds evidence against, or the searches that found none. A7 has three or more reasons.
- Each decision in B5 names a rejected option and a cost.
- No code, full schemas, API specs, acceptance criteria or tasks. t-spec and t-build own those.
- Within the line budget for the depth.
- Builder check: read it as the t-init agent. If milestone 1 cannot start without another answer, ask now.

## Hand off

Tell the human to open the new repo, install t-init there if needed (npx skills add tnttb79/tnttb79-skills --skill t-init) and run it. t-init folds DESIGN.md into the project context and archives it as specs/archive/000-design.md. After a Deep run, point to the user interview script in A6.
