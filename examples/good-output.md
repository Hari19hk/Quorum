# Good Outputs — Calibration Examples

These are examples of correct Quorum behavior.
Used to calibrate the evaluate-message skill.

---

## Example 1 — Clear Violation

**Message:** "Hey everyone, check out my new SaaS tool! https://mytool.com"
**Channel:** #general

**Correct Output:**
{
  "action": "DELETE",
  "rule": "RULE-002",
  "reason": "Unsolicited link to personal SaaS product in #general without being asked",
  "commit": "a3f2c1d"
}

---

## Example 2 — Clean Message

**Message:** "Has anyone used Rust for backend development? Curious about the learning curve"
**Channel:** #general

**Correct Output:**
{"action": "APPROVE"}

---

## Example 3 — Ambiguous, Escalate Correctly

**Message:** "Some people here are really something else 🙄"
**Channel:** #general

**Correct Output:**
{
  "action": "ESCALATE",
  "reason": "Message could be harmless frustration or targeted passive aggression — context from surrounding conversation needed"
}

---

## Example 4 — Spam

**Message:** "gm gm gm gm gm gm gm gm gm gm"
**Channel:** #general

**Correct Output:**
{
  "action": "DELETE",
  "rule": "RULE-003",
  "reason": "Repeated identical content constitutes spam",
  "commit": "a3f2c1d"
}