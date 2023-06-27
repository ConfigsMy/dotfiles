# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export PATH="${PATH}:${HOME}/.local/bin"
export TERMINAL=alacritty
export EDITOR=nvim


# >>>>>>>>>>>>>>>>>>>>>>>>>
# COMMAND LINE ALIASES
aliases_file="${HOME}/.aliases"
if [[ -f "$aliases_file" ]]; then
  source "$aliases_file"
fi
# <<<<<<<<<<<<<<<<<<<<<<<<<


# >>>>>>>>>>>>>>>>>>>>>>>>>
# ASDF CONFIG
asdf_init_file="${HOME}/.asdf/asdf.sh"
if [[ -f "$asdf_init_file" ]]; then
  source "$asdf_init_file"
fi
# <<<<<<<<<<<<<<<<<<<<<<<<<


# >>>>>>>>>>>>>>>>>>>>>>>>>
# NEEDE FOR AWESOME WM LUAROCKS PATH DETECTION
if [[ -n "$(command -v luarocks)" ]]; then
  eval "$(luarocks path)"
fi
# <<<<<<<<<<<<<<<<<<<<<<<<<

PS1='[\u@\h \W]\$ '

