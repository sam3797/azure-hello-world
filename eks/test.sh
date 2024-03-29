#!/bin/bash

# bg-deploy.sh <servicename> <version> <green-deployment.yaml>
# Deployment name should be <service>-<version>

DEPLOYMENTNAME=$1
SERVICE=$3
VERSION=$2
#DEPLOYMENTFILE=$3

#kubectl apply -f $DEPLOYMENTFILE
kubectl apply -f deployment.yaml
sleep 60;
kubectl apply -f service.yaml
sleep 180;
kubectl apply -f deployment-1.yaml

# Wait until the Deployment is ready by checking the MinimumReplicasAvailable condition.
READY=$(kubectl get deploy $DEPLOYMENTNAME -o json | jq '.status.conditions[] | select(.reason == "MinimumReplicasAvailable") | .status' | tr -d '"')
while [[ "$READY" != "True" ]]; do
    READY=$(kubectl get deploy $DEPLOYMENTNAME -o json | jq '.status.conditions[] | select(.reason == "MinimumReplicasAvailable") | .status' | tr -d '"')
    sleep 5
done

# Update the service selector with the new version
#kubectl patch svc $SERVICE -p "{\"spec\":{\"selector\": {\"name\": \"${SERVICE}\", \"version\": \"${VERSION}\"}}}"
kubectl patch svc $SERVICE -p "{\"spec\":{\"selector\": {\"app\": \"${VERSION}\"}}}"

echo "Done."
