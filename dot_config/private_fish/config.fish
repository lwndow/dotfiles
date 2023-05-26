if status is-interactive
    # homebrew
    if test -x /opt/homebrew/bin/brew
        /opt/homebrew/bin/brew shellenv | source
    end

    # pyenv
    if test -x /Users/mitch/.pyenv/bin/pyenv
        set -x PYENV_ROOT $HOME/.pyenv
        set --prepend PATH $PYENV_ROOT/bin
        pyenv init - | source
        pyenv virtualenv-init - | source
    end

    # subl command
    if test -d "/Applications/Sublime Text.app/Contents/SharedSupport/bin"
        set --prepend PATH "/Applications/Sublime Text.app/Contents/SharedSupport/bin"
        set -x EDITOR "subl"
    end

    # zoxide
    if test -x /opt/homebrew/bin/zoxide
        zoxide init fish | source
    end    

    # starship
    if test -x /opt/homebrew/bin/starship
        starship init fish | source
    end
end
