# tnttb79-skills

A personal library and development workspace for generic, reusable [Agent Skills](https://agentskills.io/). Skills are created and maintained here, installed into other projects with the [`skills.sh` CLI](https://skills.sh/), and designed to work across supported coding-agent harnesses when practical.

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

| Skill | Description |
|---|---|
| `t-init` | Initializes or updates concise shared project context through a canonical root `AGENTS.md`. |
