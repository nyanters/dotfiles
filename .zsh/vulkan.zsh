#!/usr/bin/env zsh
if [[ "$(uname)" == "Darwin" ]]; then
  export VK_ICD_FILENAMES=/opt/homebrew/opt/vulkan-tools/lib/mock_icd/VkICD_mock_icd.json
fi
