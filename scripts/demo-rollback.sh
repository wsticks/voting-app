#!/usr/bin/env bash
# Ship a bad result image on purpose, then roll it back.
set -euo pipefail
cd "$(dirname "$0")/.."

echo "History before the bad release:"
helm history voting -n voting

echo
echo "Upgrading result to a tag that does not exist..."
helm upgrade voting helm/voting-app -n voting -f helm/voting-app/values-bad.yaml

echo
kubectl get pods -n voting -l app=result || true
echo
echo "The result pod should be ImagePullBackOff or ErrImagePull."

if [[ -t 0 ]]; then
  read -r -p "Press enter to roll back. "
  helm rollback voting -n voting
  echo
  helm history voting -n voting
  kubectl get pods -n voting
else
  echo "Next: helm rollback voting -n voting"
fi
