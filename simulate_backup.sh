#!/bin/bash
# Simule une sauvegarde et envoie l'heure à Pushgateway
current_time=$(date +%s)
echo "Envoi de la métrique backup_last_success au temps $current_time"
echo "backup_last_success_timestamp_seconds $current_time" | curl --data-binary @- http://localhost:9091/metrics/job/my_backup_script
