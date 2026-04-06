#!/bin/bash
# Runs gitagent validate before every moderation session
# If validation fails, blocks the session and alerts moderators

npx gitagent validate
if [ $? -ne 0 ]; then
  echo '{"action": "block", "reason": "RULES.md failed validation — human review required"}'
  exit 1
fi

echo '{"action": "allow"}'