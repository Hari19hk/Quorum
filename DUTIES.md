# Duties — Segregation of Duties Policy

## Why This Exists

Quorum separates the act of **judging** from the act of **executing**.
No single component can both decide a ruling AND carry it out. This is 
not just good engineering — it is the same principle that prevents judges 
from also being executioners in a fair legal system.

---

## System-Wide Role Definitions

| Role | Assigned To | Permissions |
|------|-------------|-------------|
| `evaluator` | Quorum agent (LLM) | read messages, evaluate against rules, return verdict |
| `executor` | Bridge (Node.js) | delete messages, send DMs, call Discord API |
| `auditor` | Memory system | log actions, write moderation-log.md, archive history |
| `governor` | Community (via GitHub PR) | propose rules, vote, amend RULES.md |
| `supervisor` | Human moderators | review escalations, override verdicts, merge PRs |

---

## Conflict Matrix

| Conflict | Reason |
|----------|--------|
| `evaluator` ↔ `executor` | The agent that judges cannot be the one that acts |
| `evaluator` ↔ `auditor` | The agent cannot audit its own decisions |
| `governor` ↔ `supervisor` | Same person cannot propose and approve their own rule changes |
| `executor` ↔ `auditor` | The bridge that acts cannot also be the one that records |

---

## Handoff Workflow

Every moderation action follows this exact chain. No step can be skipped.

### Standard Moderation
1. [Discord] Message arrives
2. [Bridge / executor] Passes message text to Quorum agent
3. [Quorum / evaluator] Reads RULES.md → returns strict JSON verdict
4. [Bridge / executor] Receives verdict → calls Discord API to act
5. [Memory / auditor] Logs action: user, message, rule, verdict, git commit hash, timestamp
6. [Bridge / executor] DMs user with ruling + appeal instructions

### ESCALATE Verdicts
1. [Quorum / evaluator] Returns ESCALATE with reason
2. [Bridge / executor] Pings #mod-escalations channel
3. [Human / supervisor] Reviews and acts manually
4. [Memory / auditor] Logs escalation + human resolution

### Rule Amendment
1. [Community / governor] Opens Pull Request on GitHub
2. [Community / governor] Votes via Discord reactions in #governance
3. [Human / supervisor] Reviews vote outcome → merges or closes PR
4. [Bridge / rules-watcher] Detects merge → git pull → posts diff to #governance
5. [Quorum / evaluator] Reads fresh RULES.md on next invocation
6. [Memory / auditor] Logs rule change with PR number + commit hash

---

## Isolation Policy

| Layer | Isolation Level |
|-------|----------------|
| State | Full — agent has no persistent state between messages |
| Credentials | Separate — Discord token lives in bridge only, never exposed to agent |
| Rules | Read-only for agent — RULES.md can only be changed via merged PR |
| Logs | Append-only — moderation-log.md is written by auditor, never by evaluator |

---

## Enforcement: strict

No component may perform an action outside its assigned permissions.
The bridge will never act without a verdict from the evaluator.
The evaluator will never directly touch the Discord API.
The auditor will never modify existing log entries — only append.

---

## Per-Component Role Declarations

### Quorum Agent (evaluator)
- **Role:** evaluator
- **Can:** read RULES.md, read incoming message, return JSON verdict
- **Cannot:** delete messages, send DMs, write to moderation-log.md, modify RULES.md, access Discord API
- **Handoff:** always passes verdict to bridge before any action occurs

### Bridge / index.js (executor)
- **Role:** executor
- **Can:** call Discord API, delete messages, send DMs, trigger git pull
- **Cannot:** modify verdicts, skip logging, act without a verdict
- **Handoff:** always triggers memory write after every action

### Memory System (auditor)
- **Role:** auditor
- **Can:** append to moderation-log.md, append to rule-changelog.md
- **Cannot:** modify existing entries, influence verdicts, access Discord API
- **Handoff:** signals bridge when log write is confirmed

### Community Members (governor)
- **Role:** governor
- **Can:** open PRs, vote on rule changes, propose amendments
- **Cannot:** merge their own PRs, bypass the vote process, edit Operational Rules section

### Human Moderators (supervisor)
- **Role:** supervisor
- **Can:** merge approved PRs, override any verdict, review escalations
- **Cannot:** propose and merge their own rule changes unilaterally