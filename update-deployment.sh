#!/bin/bash
REPO_DIR="/home/alexander/lab"
SERVICE_NAME="update-deployment"

cd "$REPO_DIR" || exit

git fetch origin

LOCAL_COMMIT=$(git rev-parse HEAD)
REMOTE_COMMIT=$(git rev-parse origin/deployment)

if [ "$LOCAL_COMMIT" != "$REMOTE_COMMIT" ]; then
   echo "Actualizando el repo..."
   
   git pull origin deployment
   
   sudo systemctl daemon-reload
   sudo systemctl restart "$SERVICE_NAME"
else
   echo "No hay cambios en la rama"
fi
