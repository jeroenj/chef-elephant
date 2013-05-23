PROMPT='%{$fg_bold[cyan]%}%~$(parse_git_dirty)$(git_prompt_info)%{$reset_color%} '
RPROMPT='%{$fg[red]%}$(ruby-version)%{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX=" "
ZSH_THEME_GIT_PROMPT_SUFFIX=""
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[yellow]%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[green]%}"
