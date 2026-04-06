#!/bin/bash
# Logs every tool invocation with timestamp and session ID
# Input arrives as JSON on stdin

input=$(cat)
timestamp=$(date -u +"%Y-%m-%dT%H:%M:%SZ")

echo "[$timestamp] Tool call: $input" >> memory/runtime/moderation-log.md

echo '{"action": "allow"}'