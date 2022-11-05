#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Android Emulator
# @raycast.mode compact

# Optional parameters:
# @raycast.icon 📱

# Documentation:
# @raycast.description Open the Pixel 6 Pro SDK 33 emulator

/Users/jeremy/Library/Android/sdk/emulator/emulator -avd Pixel_6_Pro_API_33 &>/dev/null & disown

echo "Android Emulator started"
