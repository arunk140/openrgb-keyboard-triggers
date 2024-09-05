#!/bin/bash
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

STATE_FILE=$SCRIPT_DIR"/.plugin_state"
CONDA_ENV=$SCRIPT_DIR"/conda"
PYTHON_SCRIPT=$SCRIPT_DIR"/plugin.py"

run_python_script() {
    eval "$(conda shell.bash hook)"
    conda activate "$CONDA_ENV"
    python "$PYTHON_SCRIPT" "$@"
    conda deactivate
}

if [ ! -f "$STATE_FILE" ]; then
    echo "sleep" > "$STATE_FILE"
fi

CURRENT_STATE=$(cat "$STATE_FILE")

if [ "$CURRENT_STATE" = "sleep" ]; then
    run_python_script "--wake"
    echo "wake" > "$STATE_FILE"
    echo "Switched to wake mode"
else
    run_python_script "--sleep"
    echo "sleep" > "$STATE_FILE"
    echo "Switched to sleep mode"
fi
