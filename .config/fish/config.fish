if status is-interactive
    # ASDF VERSION MANAGER
    set asdf_config_file {$HOME}/.asdf/asdf.fish
    if test -f "$asdf_config_file"
      source "$asdf_config_file"
    end
    #
    
    # STARSHIP PROMPT
    starship init fish | source
    #
end
