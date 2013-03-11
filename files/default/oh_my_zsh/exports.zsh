# Ruby
export RUBYOPT="rubygems"

# Sublime Text as default text editor
export EDITOR="subl -w"
export VISUAL="subl"

# In order to prefer homebrew's bin dir
export PATH=/usr/local/bin:/usr/local/sbin:$PATH

# Requested by brew after installing node
export NODE_PATH=/usr/local/lib/node_modules:$NODE_PATH

# Putting the following in your shell config will make Rails even faster, but will increase its memory footprint.
export RUBY_GC_MALLOC_LIMIT=60000000
export RUBY_FREE_MIN=200000

# Make sure it is set to UTF-8
export LANG="en_US.UTF-8"