# Review checklist

Answer each question from the code. Tools are what to run. Anything marked "not from code" goes under Not checked unless you have that evidence.

## D1. Correctness against the spec

- Which code path implements each acceptance criterion?
- Which test fails if that path breaks? Name it, or say none.
- Are the edge cases handled: empty, duplicate, maximum size, concurrent edit, time zone?
- Do error paths match the spec, without partial writes?

Tools: tests, type check, build. Not from code: behaviour with real data, user experience.

## D2. Security (OWASP ASVS 5.0, level 2)

- Does each handler that reads or changes a record check the caller's right to that record (CWE-862, CWE-863, CWE-639)?
- Is any state-changing route open without authentication (CWE-306)?
- Does untrusted input reach SQL, a shell, eval, templates, file paths or outbound URLs without parameters or encoding?
- Are secrets, debug mode, open CORS or default credentials committed?
- Do failures fail closed, without swallowed exceptions or leaked internals?

Tools: dependency audit, secret scan including history, static analysis. Not from code: TLS, served headers, cloud permissions. Access rules need the spec's who-may-do-what, which is where reading code adds most: five of the 2025 CWE Top 25 are access logic, with Missing Authorization at number 4.

## D3. Reliability

- Does every remote call have a timeout?
- Are retries capped, backed off with jitter, done at one layer, and safe to repeat for writes?
- When a dependency is down, does the code fail fast, degrade or hang?
- Are multi-step writes atomic or compensated, and resources released on every path?

Not from code: availability, recovery, failover.

## D4. Scalability and performance

- A query or remote call inside a loop over results?
- A list, query, export or job with no limit?
- Blocking I/O or sleep on a request path or event loop?
- In-process state that breaks with two instances?
- Unbounded queues, caches or fan-out (CWE-770)?

Not from code: latency, throughput, capacity, cost. Ask for a metric or a load test, never claim "this will be slow". ORM misuse is common and its fixes are usually small: in a study of 12 web apps, 64 fixes gave a median 2x speed-up, mostly in under 5 lines.

## D5. Design and modularity

- Does the change fit the existing structure, or add a second way to do one thing?
- Is one rule, format or constant coded in two places?
- Does one function or module mix separate jobs, such as request parsing, business rules and data access?
- Pass-through methods or wrappers that add no behaviour?
- Must callers know the call order or the internals?
- A dependency pointing the wrong way, such as domain code importing web or database code?
- A new abstraction with a single use?

Report a design flag only when you can cite two or more places. Judge extendability only against changes already planned: a spec, an open task or the design's milestones. Tools: an import or dependency linter, if present.

## D6. Tests

- Would a test fail if the key line of each criterion flipped?
- Do tests go through public APIs and assert on results?
- Do mocks replace the code under test?
- Are assertions specific, not only "no error" or a large snapshot?
- Flakiness signals: sleeps to wait, the real clock, unseeded random, shared state, network in unit tests.

Tools: coverage to find untested criteria, not as a score; a mutation tool on changed files, if present. Not from code: CI flake history.

## D7. Readability (usually Minor)

- Do the formatter and linter pass? Run them; do not review style by hand.
- Do names say what a value holds?
- Do comments explain why, and does the change make any comment false?
- Can a reader follow each function without holding much in their head? Watch for deep nesting, flag parameters and long parameter lists.
- Is dead, commented-out or unused code left behind?

## D8. Stack fit

- Does the code use APIs that the version in the lockfile deprecates or has removed?
- Does it follow the framework's documented way for this job, such as data fetching, routing, state, config or errors?
- Does it rebuild something the framework or standard library already provides?
- Does it match how the rest of this codebase does the same thing (agent-context/development/002-conventions.md)?

Every D8 finding cites the doc page for that version or the lint rule. Tools: the stack's own linter and framework checks. Not from code: whether upgrading to a newer major version is worth it.

## Why these rules

- Google disables any analyzer whose findings developers mark Not useful more than 10% of the time, and low-severity issues in merged code are rarely fixed (Sadowski et al., CACM 2018).
- Google's AutoCommenter dropped comments on unchanged lines, 80% of its candidates, because developers do not act on them. Muting rules nobody acted on raised its useful rate from 54% to 80% (arXiv 2405.13565).
- At Microsoft, the more files in a change, the smaller the share of useful review comments (Bosu et al., MSR 2015).
- LLMs alone detect vulnerabilities poorly and are misled by renamed identifiers (arXiv 2403.18624, 2312.12575). An LLM reading static analysis output found 55 of 120 real vulnerabilities where the analyzer alone found 27 (arXiv 2405.17238).
