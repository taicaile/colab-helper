#!/usr/bin/env bash

# execute this script in a colab notebook cell
# curl -sL https://raw.githubusercontent.com/taicaile/colab-helper/master/path.sh | sudo bash

# save $PATH to /.COLABPATH
echo "$PATH" >/.COLABPATH

# add the following to ~/.bashrc
USER_RC=~/.bashrc
echo $USER_RC
LOAD_PATH_LINE="export PATH=$(cat /.COLABPATH)"
grep -qF -- "$LOAD_PATH_LINE" "$USER_RC" || {
    echo "$LOAD_PATH_LINE" >>"$USER_RC"
    # shellcheck disable=SC1090
    source "$USER_RC"
}
