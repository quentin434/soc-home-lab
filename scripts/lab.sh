#!/usr/bin/env bash
# SOC lab control: start/stop Elastic + Splunk + victim VM together
ELASTIC_DIR="$HOME/elastic-start-local"
case "$1" in
  up)
    echo "▶ Elastic...";   ( cd "$ELASTIC_DIR" && ./start.sh )
    echo "▶ Splunk...";    docker start splunk
    echo "▶ Victim VM..."; multipass start victim
    echo "✅ Lab up." ;;
  down)
    echo "⏹ Victim VM..."; multipass stop victim
    echo "⏹ Splunk...";    docker stop splunk
    echo "⏹ Elastic...";   ( cd "$ELASTIC_DIR" && ./stop.sh )
    echo "✅ Lab down." ;;
  status)
    docker ps; echo "---"; multipass list ;;
  *)
    echo "Usage: lab {up|down|status}" ;;
esac
