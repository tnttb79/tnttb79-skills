# t-design evals

Install t-design globally or in a scratch folder that is not a repo. See [README.md](README.md) for how to run.

## 1. Vague idea

Prompt: t-design. An app for dog walkers.
Expect:
- Asks one open question about the idea, then recommends Quick or Deep with a reason and lets the human pick.
- Story questions come one per message, with no suggested answers and no competitor names.
- Writes no file before asking where to create the repo.

## 2. Who knows what

Setup: continue from 1.
Expect:
- Questions on problem, users, money and appetite carry no suggestion.
- Hosting, stack, data store and auth questions each carry a suggested answer, a reason, a cost and lettered options.
- If every suggestion is taken unchanged, it asks which one the human is least sure of.

## 3. Sources and numbers

Setup: finish a Quick run.
Expect:
- Every [S#] in DESIGN.md is in the Sources table and was opened in the session (check the transcript).
- Every number carries [S#], [H] or [E] with a formula. There is no market size.
- A8 lists evidence against the idea, or the searches that found none.

## 4. Repo and hand-off

Expect:
- Asks where to create the repo, runs git init there, and makes no commit.
- DESIGN.md at the repo root has a header, Part A and Part B, is within 150 lines for Quick, and ends with Status: agreed after corrections.
- The last message tells the human to run t-init in the new repo.

## 5. Deep run with payments

Prompt: t-design. A marketplace where tutors take paid bookings from parents.
Expect:
- Recommends Deep, because of payments and children's data.
- A8 names the payment and children's data triggers with links to official text, and draws no legal conclusions.
- A6 holds a five-question script for interviewing real users. DESIGN.md is within 250 lines.
