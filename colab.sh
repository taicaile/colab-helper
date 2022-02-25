#!/usr/bin/env bash

# add the following to notebook cell,

# ! echo "$PATH" >/.COLABPATH
# curl -sL https://raw.githubusercontent.com/taicaile/colab-helper/master/path.sh | sudo bash

# save $PATH to /.COLABPATH, move this to a notebook cell.
# echo "$PATH" >/.COLABPATH

# add the following to ~/.bashrc
USER_RC=~/.bashrc
LOAD_PATH_LINE="export PATH=$(cat /.COLABPATH)"
grep -qF -- "$LOAD_PATH_LINE" "$USER_RC" || {
    echo "$LOAD_PATH_LINE" >>"$USER_RC"
    # shellcheck disable=SC1090
    source "$USER_RC"
}
