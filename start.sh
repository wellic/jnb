#!/usr/bin/env bash

set -e
#set -x
CMD=${1:-}

[ "$CMD" = '-c' ] && DO_CLEAR=1 || DO_CLEAR=0


PYTHON_VER="python3.6"
PIP="pip3"
VENV=venv
NB_DIR="notebooks"

if [ "$DO_CLEAR" = 1 -a -d "$VENV" ]; then
#    deactivate "$VENV"
    rm -rf "$VENV"
fi

virtualenv "$VENV" --python="$PYTHON_VER"
"$PIP" install --upgrade pip

source "$VENV/bin/activate"
"$PIP" install -r requirements.txt

[ -d "$NB_DIR" ] || mkdir -p "$NB_DIR"
cd "$NB_DIR"

jupyter notebook
