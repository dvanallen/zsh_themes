ZSH_THEME_GIT_PROMPT_PREFIX="%{$reset_color%}%{$fg[white]%} ["
ZSH_THEME_GIT_PROMPT_SUFFIX=""
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}*%{$fg[white]%}]"
ZSH_THEME_GIT_PROMPT_CLEAN="]"
ZSH_THEME_SVN_PROMPT_PREFIX=$ZSH_THEME_GIT_PROMPT_PREFIX
ZSH_THEME_SVN_PROMPT_SUFFIX=$ZSH_THEME_GIT_PROMPT_SUFFIX
ZSH_THEME_SVN_PROMPT_DIRTY=$ZSH_THEME_GIT_PROMPT_DIRTY
ZSH_THEME_SVN_PROMPT_CLEAN=$ZSH_THEME_GIT_PROMPT_CLEAN

vcs_status() {
    if [[ ( $(whence in_svn) != "" ) && ( $(in_svn) == 1 ) ]]; then
        svn_prompt_info
    else
        git_prompt_info
    fi
}

UC=%{$fg[white]%}       # user's color
[ $UID -eq "0" ] && UC=%{$fg[red]%}   # root's color

PROMPT='%{$reset_color%}%T ${UC}%n%{$fg[red]%}@%{$fg[white]%}%m %{$fg[blue]%}%3~$(vcs_status)%{$reset_color%}> '
