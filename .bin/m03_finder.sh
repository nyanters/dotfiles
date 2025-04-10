#!usr/bin/env bash
set -euxo pipefail
SCR_DIR=$(cd "$(dirname "$0")"; pwd)
cd "${SCR_DIR}"
# If you want to disable animation, uncomment this
# defaults write com.apple.finder DisableAllAnimations -bool true
defaults write com.apple.finder DisableAllAnimations -bool false

# Show hidden files by default
defaults write com.apple.finder AppleShowAllFiles -bool true

# Show files with all extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Display the status bar
defaults write com.apple.finder ShowStatusBar -bool true

# Display the path bar
defaults write com.apple.finder ShowPathbar -bool true

# Keep folders on top
defaults write com.apple.finder "_FXSortFoldersFirst" -bool "true"
defaults write com.apple.finder "_FXSortFoldersFirstOnDesktop" -bool "true"

# Disable changing file extension warning
defaults write com.apple.finder "FXEnableExtensionChangeWarning" -bool "false"

# Column view
defaults write com.apple.finder "FXPreferredViewStyle" -string "clmv"

defaults write com.apple.finder NewWindowTarget -string "PfLo" && \
defaults write com.apple.finder NewWindowTargetPath -string "file://${HOME}"

defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false

defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true && \
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true
return 0
