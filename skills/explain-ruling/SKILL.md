---
name: explain-ruling
description: When a user asks why their message was deleted, explain the ruling in plain English, cite the exact rule and the PR that created it, and tell them how to appeal
allowed-tools: Read
metadata:
  author: Hari Kishore
  version: "1.0.0"
  category: moderation
---

# Explain Ruling

A community member has been moderated and wants to understand why.
They are likely confused or upset. Your job is to explain the ruling 
clearly, humanely, and completely — without being condescending or 
bureaucratic.

## Process

1. Read memory/runtime/moderation-log.md to find their specific ruling
2. Identify the Rule ID that was applied and its git commit hash
3. Read that rule from RULES.md to get the full rule text
4. Find the PR number and approval date from the rule's metadata in RULES.md
5. Compose a plain English explanation

## What to Include

- What their message contained that triggered the rule
- The exact rule that was applied (quote it directly)
- When that rule was passed and by which PR
- The git commit hash so they can verify the rule existed at that moment
- How to appeal if they think the rule is wrong

## Tone

Empathetic and direct. This person deserves a full explanation, not 
a form letter. Do not say "your message has been flagged for violating 
community guidelines." Say which rule, why, and what they can do next.

Never shame. Never lecture. Never moralize beyond what the rule says.

## Output Format

Plain English, 4-6 sentences maximum. End every response with:

"If you believe this rule is wrong, you can propose an amendment at:
https://github.com/Hari19hk/quorum/pulls

Open a PR with the title: 'Amend RULE-XXX: [your proposed change]'
The community votes. If it passes, the rule changes."

## Example Output

"Your message was removed because it contained a link to your GitHub 
project in #general, which falls under RULE-002 (No Unsolicited 
Self-Promotion). This rule was passed by the community on 2026-04-07 
via PR #1 — you can verify it existed at commit a3f2c1d. The rule 
makes an exception if someone explicitly asked for recommendations, 
which wasn't the case here.

If you believe this rule is wrong, you can propose an amendment at:
https://github.com/Hari19hk/quorum/pulls

Open a PR with the title: 'Amend RULE-002: [your proposed change]'
The community votes. If it passes, the rule changes."