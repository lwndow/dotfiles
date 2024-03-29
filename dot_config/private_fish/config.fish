if status is-interactive
    # which OS?
    switch (uname)
    case Darwin
        set starship_bin_path /opt/homebrew/bin/starship
        set zoxide_bin_path /opt/homebrew/bin/zoxide
        set subl_test_path "/Applications/Sublime Text.app/Contents/SharedSupport/bin"
    case Linux
        set starship_bin_path /usr/bin/starship
        set zoxide_bin_path /usr/bin/zoxide
        set subl_test_path /usr/bin/subl
    end

    # homebrew
    if test -x /opt/homebrew/bin/brew
        /opt/homebrew/bin/brew shellenv | source
    end

    # pyenv
    if test -x $HOME/.pyenv/bin/pyenv
        set -x PYENV_ROOT $HOME/.pyenv
        set --prepend PATH $PYENV_ROOT/bin
        pyenv init - | source
        pyenv virtualenv-init - | source
    end

    # subl command
    if test -d $subl_test_path
        set --prepend PATH $subl_test_path
        set -x EDITOR "subl"
    end
    if test -x $subl_test_path
        set -x EDITOR "subl"
    end

    # zoxide
    if test -x $zoxide_bin_path
        zoxide init fish | source
    end    

    # starship
    if test -x $starship_bin_path
        starship init fish | source
    end
end
