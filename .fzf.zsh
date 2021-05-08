#export FZF_DEFAULT_COMMAND='rg --files --hidden -g "!Library" -g "!Pictures"'
export FZF_DEFAULT_COMMAND='fd --type f'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

bindkey -s '^v' 'nvim $(fzf)^M'
