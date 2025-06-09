#!/usr/bin/env zsh
if [[ "$(uname)" == "Darwin" ]]; then
  export VULKAN_SDK=${HOME}/VulkanSDK/macOS
  export PATH=${VULKAN_SDK}/bin:$PATH
  export DYLD_LIBRARY_PATH=/opt/homebrew/opt/vulkan-tools/lib:${DYLD_LIBRARY_PATH}
#   export VK_ICD_FILENAMES=/opt/homebrew/opt/vulkan-tools/lib/mock_icd/VkICD_mock_icd.json
  export VK_ICD_FILENAMES=${VULKAN_SDK}/share/vulkan/icd.d/MoltenVK_icd.json
  export VK_LAYER_PATH=/opt/homebrew/opt/vulkan-extensionlayer/share/vulkan/explicit_layer.d
fi
