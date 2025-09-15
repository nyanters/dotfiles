#!usr/bin/env bash
set -euo pipefail
SCR_DIR=$(cd "$(dirname "$0")"; pwd)
cd "${SCR_DIR}"

# ====================
#
# Base
#
# ====================

# Disable auto-capitalization
defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false

# ====================
#
# Dock & Launchpad
#
# ====================

# If you want to disable animation at application launch, uncomment this
# defaults write com.apple.dock launchanim -bool false
defaults write com.apple.dock launchanim -bool true
defaults write com.apple.dock persistent-apps -array
defaults write com.apple.dock springboard-columns -int 8
defaults write com.apple.dock springboard-rows -int 6
defaults write com.apple.dock tilesize -int 16
# find 2>/dev/null /private/var/folders/ -type d -name com.apple.dock.launchpad -exec rm -rf {} +
defaults write com.apple.dock persistent-others -array-add '{ "tile-data" = { "list-type" = 1; }; "tile-type" = "recents-tile"; }'
# ====================
#
# SystemUIServer
#
# ====================

# Display date, day, and time in the menu bar
defaults write com.apple.menuextra.clock DateFormat -string 'EEE d MMM HH:mm'

# Display battery level in the menu bar
defaults write com.apple.menuextra.battery ShowPercent -string "YES"

for app in "Dock" \
    "Finder" \
    "SystemUIServer"; do
    killall "${app}" &> /dev/null
done

# ====================
#
# Google Chrome
#
# ====================

defaults write com.google.Chrome AppleLanguages '(en-JP)'

# ====================
#
# Keyboard
#
# ====================

# defaults write -g KeyRepeat -int 1
# defaults write -g InitialKeyRepeat -int 25
defaults write -g KeyRepeat -int 2
defaults write -g InitialKeyRepeat -int 15
# Use function keys as standard function keys
defaults write NSGlobalDomain com.apple.keyboard.fnState -bool true
defaults write com.apple.inputmethod.Kotoeri JIMPrefFullWidthNumeralCharactersKey -int 0

# ====================
#
# Metadata
#
# ====================

defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

# ====================
#
# Safari
#
# ====================

defaults write NSGlobalDomain WebKitDeveloperExtras -bool true

# ====================
#
# Screenshots
#
# ====================

# Save to ~/Downloads
defaults write com.apple.screencapture "location" -string "~/Downloads"
killall SystemUIServer

# ====================
#
# Trackpad
#
# ====================

# Click weight (threshold) -> Light
defaults write com.apple.AppleMultitouchTrackpad "FirstClickThreshold" -int "0"

# ====================
#
# Others
#
# ====================

# Disable Photos.app
defaults -currentHost write com.apple.ImageCapture disableHotPlug -bool YES
# Don't offer new disks for Time Machine backup
defaults write com.apple.TimeMachine "DoNotOfferNewDisksForBackup" -bool "true"
# XQuartz: enable Indirect GLX
defaults write org.macosforge.xquartz.X11 enable_iglx -bool true
# Enable aptX
defaults write bluetoothaudiod "Enable AptX codec" -bool true
return 0
