#!/usr/bin/env bash
set -euo pipefail
: "${KUBECONFIG:?need kubeconfig}"
: "${NAMESPACE:=people}"
: "${IMAGE:?need image}"  # e.g. 123456789012.dkr.ecr.ap-south-1.amazonaws.com/people-api:abcd123
kubectl apply -k base/
kubectl -n "$NAMESPACE" set image deployment/people-api api="$IMAGE" --record
kubectl -n "$NAMESPACE" rollout status deployment/people-api --timeout=180s
