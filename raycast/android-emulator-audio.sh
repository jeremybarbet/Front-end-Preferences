#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Android emulator audio
# @raycast.mode compact

# Optional parameters:
# @raycast.icon 🔊

# Documentation:
# @raycast.description Disable audio for Android emulators, useful to avoid issue with bluetooth headphones

AVD_PATH=~/.android/avd

function run_sed {
  sed -i '' $1 $2
}

echo "Processing emulators from: $AVD_PATH"

for emulator in $(find $AVD_PATH -type d -name '*.avd'); do
  if [ ! -f $emulator/config.ini ]; then
    echo "Skipping emulator - could not find config.ini inside $emulator"
    continue
  fi

  echo "Processing - $(basename $emulator)"

  # Remove line hw.audioInput - if exists
  run_sed '/^hw.audioInput/d' $emulator/config.ini

  # Remove line hw.audioOutput - if exists
  run_sed '/^hw.audioOutput/d' $emulator/config.ini

  # Disable audio input and output
  echo "hw.audioInput=no" >> $emulator/config.ini
  echo "hw.audioOutput=no" >> $emulator/config.ini

  # Sort config keys
  sort -o $emulator/config.ini $emulator/config.ini

  echo "Done - $(basename $emulator)"
done
