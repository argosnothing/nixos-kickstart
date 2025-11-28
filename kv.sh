STATE_FILE="kickstart.json"
COMMAND="${1:-}"
if [[ ! -f "$STATE_FILE" || ! -s "$STATE_FILE" ]]; then
    echo '{}' > "$STATE_FILE"
fi
function kv_set() {
    local key="$1"
    local value="$2"

    jq --arg k "$key" --arg v "$value" \
        '.[$k] = $v' "$STATE_FILE" > "${STATE_FILE}.tmp" \
        && mv "${STATE_FILE}.tmp" "$STATE_FILE"
}

function kv_get() {
    local key="$1"
    jq -r --arg k "$key" '.[$k] // empty' "$STATE_FILE"
}

if [[ "$COMMAND" == "kv_get" ]]; then
    kv_get $2
fi

if [[ "$COMMAND" == "kv_set" ]]; then
    kv_set $2 $3
fi
