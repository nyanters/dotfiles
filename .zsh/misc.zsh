#!/usr/bin/env zsh
if [[ "$(uname)" == "Darwin" ]]; then
  export CPPFLAGS="-I/usr/local/opt/openjdk/include"
  export CPPFLAGS="-I/opt/homebrew/opt/openssl@3/include"
  export CPPFLAGS="-I/opt/homebrew/opt/sqlite/include"
  export CPPFLAGS="-I/usr/local/opt/zlib/include"
  export CPPFLAGS="-I/opt/homebrew/opt/readline/include"
  export CONFIGURE_OPTS="--with-openssl=-I/opt/homebrew/opt/openssl@3"
  export LDFLAGS="-L/opt/homebrew/opt/openssl@3/lib"
  export LDFLAGS="-L/opt/homebrew/opt/readline/lib"
  export LDFLAGS="-L/opt/homebrew/opt/sqlite/lib"
  export LDFLAGS="-L/usr/local/opt/zlib/lib"
  export PATH=$PATH:~/Library/Android/sdk/platform-tools
  export PATH="/usr/local/opt/openjdk/bin:$PATH"
  export PATH="/usr/local/sbin:$PATH"
  export PATH="/opt/homebrew/opt/bzip2/bin:$PATH"
  export PATH="/opt/homebrew/opt/sqlite/bin:$PATH"
  export PATH="/usr/local/bin:$PATH"
  export PATH="/opt/homebrew/opt/openssl@3/bin:$PATH"
  export PKG_CONFIG_PATH="/opt/homebrew/opt/openssl@3/lib/pkgconfig"
  export PKG_CONFIG_PATH="/opt/homebrew/opt/sqlite/lib/pkgconfig"
  export PKG_CONFIG_PATH="/usr/local/opt/zlib/lib/pkgconfig"
  export PKG_CONFIG_PATH="/opt/homebrew/opt/readline/lib/pkgconfig"
fi
