REPO_DIR=""
SERVICE_NAME=""

cd "$REPO_DIR" || exit

git fetch origin

LOCAL_COMMIT=$(git rev-parse HEAD)
REMOTE_COMMIT=$(git rev-parse origin/Deployment)

if ["$LOCAL_COMMIT" != "$REMOTE_COMMIT"]; then
   echo "Actualizando el repo..."
   
   git pull origin Deployment
   
   systemctl reload "$SERVICE_NAME"
else
   echo "No hay cambios en la rama"
fi
