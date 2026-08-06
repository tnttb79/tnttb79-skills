# tnttb79-skills

A personal skills factory: a library and development workspace where generic, reusable [Agent Skills](https://agentskills.io/) are authored once against the open standard, then installed into other projects with the [`skills.sh` CLI](https://skills.sh/). The emphasis is disciplined, portable authoring — no leaked harness assumptions — so a single install works across supported coding-agent harnesses regardless of which one you use.

Browse these skills on skills.sh: [tnttb79/tnttb79-skills](https://www.skills.sh/tnttb79/tnttb79-skills)

## Installation

List available skills from a GitHub repository:

```bash
npx skills add OWNER/REPOSITORY --list
```

Install one skill into the current project:

```bash
npx skills add OWNER/REPOSITORY \
  --skill your-skill
```

Install for selected harnesses:

```bash
npx skills add OWNER/REPOSITORY \
  --skill your-skill \
  --agent claude-code \
  --agent codex \
  --agent cursor
```

Install globally:

```bash
npx skills add OWNER/REPOSITORY \
  --skill your-skill \
  --global
```

Update installed skills:

```bash
npx skills update
```

## Available Skills

| Skill | Description | Install |
|---|---|---|
| `t-init` | Initializes or updates concise shared project context through a canonical root `AGENTS.md`. | `npx skills add tnttb79/tnttb79-skills --skill t-init` |
