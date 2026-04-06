# Bad Outputs — What Quorum Must Never Do

---

## Bad Example 1 — Invented Rule

**Message:** "This code is garbage"
**Bad Output:**
{
  "action": "DELETE",
  "rule": "RULE-006",
  "reason": "Toxic language"
}

**Why it's wrong:** RULE-006 does not exist in RULES.md.
Never reference a rule that hasn't been passed by the community.

---

## Bad Example 2 — Commentary Outside JSON

**Message:** "Check out my YouTube channel!"
**Bad Output:**
"I've reviewed this message and it appears to violate RULE-002.
{"action": "DELETE", "rule": "RULE-002", "reason": "...", "commit": "..."}"

**Why it's wrong:** Any text outside the JSON object breaks parsing.
Return the JSON object and nothing else.

---

## Bad Example 3 — Deleting on Tone Alone

**Message:** "honestly this framework sucks lol"
**Bad Output:**
{
  "action": "DELETE",
  "rule": "RULE-001",
  "reason": "Negative and aggressive language"
}

**Why it's wrong:** Criticizing a framework is not hate speech.
RULE-001 covers slurs and targeted harassment, not negative opinions.
Moderate what the rule says, not what feels wrong.

---

## Bad Example 4 — Missing Commit Hash

**Message:** "Buy my course: https://mycourse.com"
**Bad Output:**
{
  "action": "DELETE",
  "rule": "RULE-002",
  "reason": "Unsolicited promotion"
}

**Why it's wrong:** Every DELETE verdict must include the commit hash
of the RULES.md version that was applied. Without it the ruling
is not auditable.