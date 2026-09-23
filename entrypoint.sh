#!/bin/sh
set -e

# session file must live in a persisted volume so login survives container restarts
ln -sf /app/session/session_name.session /app/session_name.session 2>/dev/null || true

ARGS="$ENTITY"
[ -n "$FORMAT" ] && ARGS="$ARGS --format $FORMAT"
ARGS="$ARGS --output ${OUTPUT:-/app/downloads} --limit ${LIMIT:-100}"

while true; do
    echo "$(date -Iseconds) - starting download run"
    python main.py $ARGS
    echo "$(date -Iseconds) - run finished, sleeping ${INTERVAL:-3600}s"
    sleep "${INTERVAL:-3600}"
done
