set -Ux XDG_CONFIG_HOME "$HOME/.config"
set -Ux FISH_USER_CONFIG_DIR "$XDG_CONFIG_HOME/fish/user"
set -g fzf_preview_dir_cmd "eza --all --color=always"
set -g fzf_fd_opts --hidden --max-depth 5 --color always

source $FISH_USER_CONFIG_DIR/vars.fish
# source $FISH_USER_CONFIG_DIR/proxy.fish

if status is-interactive
    # Commands to run in interactive sessions can go here
end

# pnpm
set -gx PNPM_HOME "/home/sortextg/.local/share/pnpm"
if not string match -q -- $PNPM_HOME $PATH
    set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end

# Aliases
# function cd
#     z
# end
