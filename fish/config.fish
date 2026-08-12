source /usr/share/cachyos-fish-config/cachyos-config.fish

function fish_greeting
    # smth smth
end

# SSH Agent
if not set -q SSH_AUTH_SOCK
    eval (ssh-agent -c)
    ssh-add ~/.ssh/github 2>/dev/null
end

# Pi
fish_add_path "$HOME/.local/bin"
