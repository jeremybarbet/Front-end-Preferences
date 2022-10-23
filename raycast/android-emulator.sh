#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Android Emulator
# @raycast.mode compact

# Optional parameters:
# @raycast.icon 📱

/Users/jeremy/Library/Android/sdk/emulator/emulator -avd Pixel_6_Pro_API_33 &>/dev/null & disown

echo "Android Emulator started"
