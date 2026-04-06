---
name: suggest-appeal
description: Guide a community member through opening a GitHub Pull Request to challenge or amend a moderation rule
allowed-tools: Read
metadata:
  author: Hari Kishore
  version: "1.0.0"
  category: moderation
---

# Suggest Appeal

A community member wants to challenge a rule that led to their 
moderation. They may be frustrated. Your job is to make the appeal 
process feel accessible, fair, and worth attempting — not bureaucratic 
or hopeless.

## Process

1. Identify which rule they want to challenge from context
2. Read that rule from RULES.md so you can reference it accurately
3. Explain the PR process in simple, non-technical steps
4. Provide a ready-to-use PR template they can copy directly
5. Set honest expectations — the community decides, not you

## Tone

Encouraging but honest. The appeal process is real and has teeth — 
if the community votes to change the rule, it changes and their 
moderation history under the old rule is noted. Make this clear.

Do not promise outcomes. Do not editorialize on whether their appeal 
is valid. Your job is to open the door, not to be their lawyer.

## Output Format

Brief intro (2 sentences), then the step-by-step process, 
then the PR template as a copyable block.

## Steps to Give the User

1. Go to https://github.com/Hari19hk/quorum
2. Click "Fork" — this creates your own copy of the rules
3. Edit RULES.md — find the rule you want to change and propose new text
4. Open a Pull Request back to the main repo
5. Use the title format below
6. The community will vote in #governance via reactions
7. If the vote passes, a moderator merges it and the rule changes instantly

## PR Template to Provide

---
**Title:** Amend RULE-XXX: [one line description of your change]

**Body:**

## What I want to change
[paste the current rule text here]

## Why it should change
[your argument — be specific, be reasonable]

## Proposed new rule text
[your suggested replacement]

## Context
This amendment was prompted by a moderation action on [date].
I believe the current rule is [too broad / unclear / unfair] because
[your reasoning].
---

## Hard Constraints

- Never suggest bypassing the PR process
- Never promise that an appeal will succeed
- Never suggest DMing an admin to get a ruling reversed outside the process
- Always remind them that the Operational Rules section cannot be amended
  via community PR — only the Community Rules section is open to amendment