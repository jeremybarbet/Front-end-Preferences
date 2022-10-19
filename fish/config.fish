# Colors schemes
set --global blanc c2c7cc
set --global vert 9ccc85
set --global rouge cc5c65
set -g red_c (set_color cc5c65)

# Overwrite some default colors
set --global fish_color_command 7ed4e6
set --global fish_color_param 7ed4e6
set --global fish_color_normal 7ed4e6
set --global fish_color_error 7ed4e6

# fish prompt
function fish_prompt --description 'Write out the prompt'
  if not set -q __fish_prompt_normal
  set -g __fish_prompt_normal (set_color $blanc)
  end

  if not set -q __git_cb
    set __git_cb (set_color $rouge)" ‹"(git branch 2>/dev/null | sed -n '/\* /s///p')"› "(set_color $blanc)
  end

  switch $USER

  case root

  if not set -q __fish_prompt_cwd
      if set -q fish_color_cwd_root
          set -g __fish_prompt_cwd (set_color $fish_color_cwd_root)
      else
          set -g __fish_prompt_cwd (set_color $fish_color_cwd)
      end
  end

  printf '%s ' (date "+$red_c%H:%M:%S")
  printf '%s%s' "$__fish_prompt_cwd" (prompt_pwd) "$__fish_prompt_normal" $__git_cb
  printf '\n%s%s%s $ ' $USER

  case '*'

  if not set -q __fish_prompt_cwd
      set -g __fish_prompt_cwd (set_color $vert)
  end

  printf '%s ' (date "+$red_c%H:%M:%S")
  printf '%s%s' "$__fish_prompt_cwd" (prompt_pwd) "$__fish_prompt_normal" $__git_cb
  printf '\n%s%s%s $ ' $USER

  end
end

# Remove greeting
set fish_greeting ""

# Aliases
alias g='git'

# JAVA options
setenv JAVA_OPTS "-Xms2048m -Xmx2048m"
setenv _JAVA_OPTS $JAVA_OPTS
setenv _JAVA_OPTIONS $JAVA_OPTS

# Root for Brew and its executable
set -gx PATH $PATH /opt/homebrew/
set -gx PATH $PATH /opt/homebrew/bin

# Android SDKs
set -gx ANDROID_SDK_ROOT /Users/jeremy/Library/Android/sdk
set -gx PATH $PATH /Users/jeremy/Library/Android/sdk/tools
set -gx PATH $PATH /Users/jeremy/Library/Android/sdk/emulator
set -gx PATH $PATH /Users/jeremy/Library/Android/sdk/platform-tools

# Ruby
set -gx fish_user_paths $fish_user_paths "/usr/local/opt/ruby/bin"

# Redis server
set -gx PATH $PATH /opt/homebrew/Caskroom/redis-stack-server/6.2.4-v3/bin

# Global Yarn packages
set -gx PATH $PATH /Users/jeremy/.config/yarn/global

# Rvm
rvm default

# Apply changes straight away when saving this file
source
