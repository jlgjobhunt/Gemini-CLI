#!/bin/bash

# === CONFIGURATION ===
# The command to execute and keep alive.
# IMPORTANT: Replace this with the actual command to run the Gemini thought experiment.
# For example: "gemini-cli --flags > thought_experiment.log"
COMMAND_TO_RUN='for i in {1..60}; do echo "- $(date): Minute $i of the experiment." >> Gemini-Thought-Experiment-2.md; sleep 60; done'

# The host to check for connectivity.
CHECK_HOST="generativelanguage.googleapis.com"
CHECK_PORT="443"

# Time to wait between checks in seconds.
SLEEP_INTERVAL=60
# Timeout for the netcat command.
NC_TIMEOUT=10

# Log file for the supervisor's actions.
LOG_FILE="supervisor.log"

# === SUPERVISOR LOGIC ===

log() {
    echo "$(date): $1" | tee -a "$LOG_FILE"
}

run_command() {
    log "Starting monitored command..."
    # Execute the command in the background and store its PID
    setsid bash -c "$COMMAND_TO_RUN" &
    PID=$!
    log "Command started with PID: $PID"
}

# Initial start
run_command

while true; do
    sleep $SLEEP_INTERVAL

    # Check if the process is still running. If not, restart it.
    if ! kill -0 $PID > /dev/null 2>&1; then
        log "Monitored process (PID: $PID) is no longer running. Checking network before restart..."
        # Wait for the network to come back online before restarting.
        while ! nc -z -w $NC_TIMEOUT $CHECK_HOST $CHECK_PORT; do
            log "Network is down. Retrying in $SLEEP_INTERVAL seconds..."
            sleep $SLEEP_INTERVAL
        done
        log "Network is online. Restarting process."
        run_command
        continue # Continue to the next loop iteration
    fi

    # Check for network connectivity.
    if ! nc -z -w $NC_TIMEOUT $CHECK_HOST $CHECK_PORT; then
        log "Network connection to $CHECK_HOST:$CHECK_PORT failed."
        log "Killing process group (PGID: $PID) and waiting for network to recover."
        
        # Kill the entire process group started by setsid
        kill -- -$PID > /dev/null 2>&1
        
        # Wait for the network to come back online.
        while ! nc -z -w $NC_TIMEOUT $CHECK_HOST $CHECK_PORT; do
            log "Network still down. Retrying in $SLEEP_INTERVAL seconds..."
            sleep $SLEEP_INTERVAL
        done
        
        log "Network connection restored."
        run_command
    fi
done
