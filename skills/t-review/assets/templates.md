# Review templates

Placeholders are in angle brackets. Delete a section only when it is empty, and write "none" rather than leaving Not checked out.

## spec.md

```markdown
# <NNN>: Review of <scope>

Status: draft
Scope: <spec folder, commit range, or whole app>
Date: <YYYY-MM-DD>

## Summary

<Two to four sentences: what was reviewed, its overall state, the most important problem.>

## Checks run

| Command | Exit | Notes |
|---|---|---|
| `<command>` | <code> | <failing lines, or what it covers> |

## Fix first

### F1 (<correctness, security, reliability, scalability, design or tests>): <the problem in one line>

- Where: <path:line, symbol>
- Evidence: <the code fact, quoting the line where it helps>
- Why: <the consequence, and the AC, CWE or ASVS ID, or failing check>
- Fix: <the smallest change that removes it>
- Check: <command, or the new test the fix needs>
- Confidence: <confirmed by running | confirmed by reading>

## Minor

Not tasks unless the human picks them.

- M1 (<kind>) <path:line>: <problem>. Fix: <one line>.
- <and N more of the same kind>

## Questions

- Q1 <path:line>: <what looks wrong, and what would confirm it>

## Not checked

- <area>: <why, and what would check it>

## Outside scope

- <path:line>: <a problem in unchanged code that does not block the spec>
```

## tasks.md

```markdown
# <NNN>: Review of <scope> tasks

Status: draft
Spec: spec.md

- [ ] T1 (F1): <fix>. Done when: `<command>`
- [ ] T2 (all): Re-run the review checks. Done when: `<check command>`

## Log
```
