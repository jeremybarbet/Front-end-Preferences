#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title kp
# @raycast.mode silent

# Optional parameters:
# @raycast.icon 🤖
# @raycast.argument1 { "type": "text", "placeholder": "port" }

# Documentation:
# @raycast.description Kill any port you want

kill -9 $(lsof -t -i :"$1")
