#!/bin/bash

kubectl apply -f recreate.yaml

start_time=$(date +%s)
kubectl rollout status deployment --timeout=300s
end_time=$(date +%s)
echo "Recreate: $((end_time - start_time)) сек."

kubectl apply -f rolling.yaml

start_time=$(date +%s)
kubectl rollout status deployment--timeout=300s
end_time=$(date +%s)
echo "Rolling: $((end_time - start_time)) сек."