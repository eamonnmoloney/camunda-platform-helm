#!/bin/bash
#
# Runs before the Camunda Helm chart upgrade step in the "upgrade-minor" flow.
#
# Clears the stale spec.strategy.rollingUpdate field from the Web Modeler restapi
# Deployment before the minor upgrade. The previously released chart renders
# strategy.type=RollingUpdate, so the API server defaults spec.strategy.rollingUpdate.
# When the target chart sets webModeler.persistence.deploymentStrategy=Recreate
# (component-persistence scenario), Helm's server-side apply sets type=Recreate but
# cannot remove the defaulted rollingUpdate field it never owned, and Kubernetes
# rejects the upgrade with:
#   spec.strategy.rollingUpdate: Forbidden: may not be specified when strategy type is 'Recreate'
# Removing the field here lets the upgrade apply cleanly. This mirrors the one-time
# migration a user performs when switching an existing release to Recreate.
#
# Safe and idempotent: a no-op when Web Modeler is not deployed, and for RollingUpdate
# scenarios the API server simply re-defaults the field on the next apply.
set -euo pipefail

restapi=$(kubectl get deploy -n "${TEST_NAMESPACE}" \
  -l app.kubernetes.io/component=restapi -o name 2>/dev/null || true)
if [ -n "${restapi}" ]; then
  echo "Clearing stale spec.strategy.rollingUpdate from ${restapi} before upgrade-minor"
  kubectl patch -n "${TEST_NAMESPACE}" "${restapi}" --type=json \
    -p '[{"op":"remove","path":"/spec/strategy/rollingUpdate"}]' 2>/dev/null || true
fi
