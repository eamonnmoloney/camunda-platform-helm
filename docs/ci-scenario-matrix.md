---
title: CI Scenario Matrix and Index-Prefix Coverage
---

# CI Scenario Matrix and Index-Prefix Coverage

## Feature matrix

One row per `(chart version x platform x scenario name x shortname)` exercised by a cron-triggered nightly workflow under `camunda/c8-cross-component-e2e-tests/.github/workflows/playwright_sm_nightly_*.yml`.

- **PR CI** is enabled when at least one matching row in `charts/camunda-platform-<v>/test/ci-test-config.yaml` has `enabled: true`.
- **Prefix-aligned** is `OK` for minor-upgrade pairs covered by `TestNightlyUpgradePrefixAlignment`; install-only rows are `n/a`.
- Upgrade rows use `modular-upgrade-minor`; install legs for the previous chart version keep `flow: install` and the same shortname. Rows that need a logical scenario name different from the row name use `prefix-key`.

| version | platform | scenario | shortname | flow | PR CI | nightly workflow | prefix-aligned |
|---|---|---|---|---|---|---|---|
| 8.7 | eks, gke | qa-elasticsearch | qael | install | disabled | `playwright_sm_nightly_tests_chrome_8_7.yml`, `playwright_sm_nightly_tests_edge_8_7.yml`, `playwright_sm_nightly_tests_firefox_8_7.yml` | n/a |
| 8.7 | gke | qa-elasticsearch | qaelupg | install | disabled | `playwright_sm_nightly_upgrade_minor_8_8.yml` (`8-7-install`) | n/a |
| 8.7 | gke | qa-elasticsearch-mt | qaelmt | install | disabled | `playwright_sm_nightly_mt_8_7.yml` | n/a |
| 8.7 | gke | qa-elasticsearch-rba | qaelrba | install | disabled | `playwright_sm_nightly_rba_8_7.yml` | n/a |
| 8.7 | gke | qa-opensearch | qaos | install | disabled | `playwright_sm_nightly_tests_opensearch_8_7.yml` | n/a |
| 8.8 | eks | qa-document-store | qadoc | install | disabled | `playwright_sm_nightly_document_store_8_8.yml` | n/a |
| 8.8 | eks | qa-document-store | qadocupg | install | disabled | `playwright_sm_nightly_upgrade_minor_document_store_8_9.yml` (`8-8-install`) | n/a |
| 8.8 | gke | qa-elasticsearch | qaelupg | install | disabled | `playwright_sm_nightly_upgrade_minor_8_9.yml` (`8-8-install`) | n/a |
| 8.8 | gke | qa-elasticsearch-mt | qaelmtupg | install | disabled | `playwright_sm_nightly_upgrade_minor_mt_8_9.yml` (`8-8-install`) | n/a |
| 8.8 | gke | qa-elasticsearch-mt-tasklist-v1 | qaelmtupg | install | disabled | `playwright_sm_nightly_mt_8_8.yml` | n/a |
| 8.8 | gke | qa-elasticsearch-mt-upg | qaelmtupg | install | disabled | `playwright_sm_nightly_mt_8_8.yml` | n/a |
| 8.8 | gke | qa-elasticsearch-rba-tasklist-v1 | qaelrbaupg | install | disabled | `playwright_sm_nightly_rba_8_8.yml` | n/a |
| 8.8 | gke | qa-elasticsearch-rba-upg | qaelrbaupg | install | disabled | `playwright_sm_nightly_rba_8_8.yml` | n/a |
| 8.8 | gke | qa-elasticsearch-tasklist-v1 | qaelupg | install | disabled | `playwright_sm_nightly_tests_chrome_8_8.yml` | n/a |
| 8.8 | gke | qa-elasticsearch-upg | qaelupg | install, modular-upgrade-minor | disabled | `playwright_sm_nightly_tests_chrome_8_8.yml`, `playwright_sm_nightly_upgrade_minor_8_8.yml` (`8-8-plus-upgrade`) | OK |
| 8.8 | gke | qa-license-tasklist-v1 | licupg | install | disabled | `playwright_sm_nightly_license_8_8.yml` | n/a |
| 8.8 | gke | qa-license-upg | licupg | install | disabled | `playwright_sm_nightly_license_8_8.yml` | n/a |
| 8.8 | gke | qa-opensearch | qaosupg | install | disabled | `playwright_sm_nightly_upgrade_minor_opensearch_8_9.yml` (`8-8-install`) | n/a |
| 8.8 | gke | qa-opensearch-tasklist-v1 | qaosupg | install | disabled | `playwright_sm_nightly_tests_opensearch_8_8.yml` | n/a |
| 8.8 | gke | qa-opensearch-upg | qaosupg | install | disabled | `playwright_sm_nightly_tests_opensearch_8_8.yml` | n/a |
| 8.9 | eks | qa-document-store | qadoc | install | disabled | `playwright_sm_nightly_document_store_8_9.yml` | n/a |
| 8.9 | eks | qa-document-store | qadocupg | install | disabled | `playwright_sm_nightly_upgrade_minor_document_store_8_10.yml` (`8-9-install`) | n/a |
| 8.9 | eks | qa-document-store-upg | qadocupg | modular-upgrade-minor | enabled | `playwright_sm_nightly_upgrade_minor_document_store_8_9.yml` (`8-9-upgrade`) | OK |
| 8.9 | gke | qa-elasticsearch | qaelupg | install | disabled | `playwright_sm_nightly_upgrade_minor_8_10.yml` (`8-9-install`) | n/a |
| 8.9 | gke | qa-elasticsearch-mt | qaelmtupg | install | disabled | `playwright_sm_nightly_upgrade_minor_mt_8_10.yml` (`8-9-install`) | n/a |
| 8.9 | gke | qa-elasticsearch-mt-tasklist-v1 | qaelmtupg | install | disabled | `playwright_sm_nightly_mt_8_9.yml` | n/a |
| 8.9 | gke | qa-elasticsearch-mt-upg | qaelmtupg | install, modular-upgrade-minor | disabled | `playwright_sm_nightly_mt_8_9.yml`, `playwright_sm_nightly_upgrade_minor_mt_8_9.yml` (`8-9-upgrade`) | OK |
| 8.9 | gke | qa-elasticsearch-rba-tasklist-v1 | qaelrbaupg | install | disabled | `playwright_sm_nightly_rba_8_9.yml` | n/a |
| 8.9 | gke | qa-elasticsearch-rba-upg | qaelrbaupg | install | disabled | `playwright_sm_nightly_rba_8_9.yml` | n/a |
| 8.9 | gke | qa-elasticsearch-tasklist-v1 | qaelupg | install | disabled | `playwright_sm_nightly_tests_chrome_8_9.yml` | n/a |
| 8.9 | gke | qa-elasticsearch-upg | qaelupg | install, modular-upgrade-minor | disabled | `playwright_sm_nightly_tests_chrome_8_9.yml`, `playwright_sm_nightly_upgrade_minor_8_9.yml` (`8-9-upgrade`) | OK |
| 8.9 | gke | qa-license-tasklist-v1 | licupg | install | disabled | `playwright_sm_nightly_license_8_9.yml` | n/a |
| 8.9 | gke | qa-license-upg | licupg | install | disabled | `playwright_sm_nightly_license_8_9.yml` | n/a |
| 8.9 | gke | qa-opensearch | qaosupg | install | disabled | `playwright_sm_nightly_upgrade_minor_opensearch_8_10.yml` (`8-9-install`) | n/a |
| 8.9 | gke | qa-opensearch-tasklist-v1 | qaosupg | install | disabled | `playwright_sm_nightly_tests_opensearch_8_9.yml` | n/a |
| 8.9 | gke | qa-opensearch-upg | qaosupg | install, modular-upgrade-minor | enabled | `playwright_sm_nightly_tests_opensearch_8_9.yml`, `playwright_sm_nightly_upgrade_minor_opensearch_8_9.yml` (`8-9-upgrade`) | OK |
| 8.10 | eks | qa-document-store | qadoc | install | disabled | `playwright_sm_nightly_document_store_8_10.yml` | n/a |
| 8.10 | eks | qa-document-store-upg | qadocupg | modular-upgrade-minor | enabled | `playwright_sm_nightly_upgrade_minor_document_store_8_10.yml` (`8-10-upgrade`) | OK |
| 8.10 | gke | qa-elasticsearch-mt | qaelmt | install | disabled | `playwright_sm_nightly_mt_8_10.yml` | n/a |
| 8.10 | gke | qa-elasticsearch-mt-upg | qaelmtupg | modular-upgrade-minor | enabled | `playwright_sm_nightly_upgrade_minor_mt_8_10.yml` (`8-10-upgrade`) | OK |
| 8.10 | gke | qa-elasticsearch-rba | qaelrba | install | disabled | `playwright_sm_nightly_rba_8_10.yml` | n/a |
| 8.10 | gke | qa-elasticsearch-upg | qaelupg | install, modular-upgrade-minor | disabled | `playwright_sm_nightly_tests_chrome_8_10.yml`, `playwright_sm_nightly_upgrade_minor_8_10.yml` (`8-10-upgrade`) | OK |
| 8.10 | gke | qa-opensearch | qaos | install | disabled | `playwright_sm_nightly_tests_opensearch_8_10.yml` | n/a |
| 8.10 | gke | qa-opensearch-upg | qaosupg | modular-upgrade-minor | enabled | `playwright_sm_nightly_upgrade_minor_opensearch_8_10.yml` (`8-10-upgrade`) | OK |

Tier-1/tier-2 PR rows not exercised by cron nightlies are omitted. See `charts/camunda-platform-<v>/test/ci-test-config.yaml` for the full PR matrix.

## Index-prefix coverage

Per `(version x persistence layer)`, which `$*_INDEX_PREFIX` placeholders appear in `charts/camunda-platform-<v>/test/integration/scenarios/chart-full-setup/values/persistence/<L>.yaml`. `Y` means referenced, `-` means the file exists but has no reference, and `n/a` means the file does not exist for this version.

### 8.7

| persistence | ORCH | OPERATE | TASKLIST | OPTIMIZE |
|---|---|---|---|---|
| elasticsearch | - | - | - | - |
| elasticsearch-external | Y | Y | Y | Y |
| elasticsearch-self-signed | - | - | - | - |
| opensearch | Y | Y | Y | Y |
| opensearch-embedded | Y | Y | Y | Y |
| opensearch-external | Y | Y | Y | Y |
| no-elasticsearch, rdbms*, elasticsearch-external-self-signed | n/a | n/a | n/a | n/a |

### 8.8

| persistence | ORCH | OPERATE | TASKLIST | OPTIMIZE |
|---|---|---|---|---|
| elasticsearch | - | - | - | - |
| elasticsearch-external | Y | - | - | Y |
| elasticsearch-self-signed | - | - | - | - |
| elasticsearch-external-self-signed | Y | - | - | Y |
| opensearch | Y | - | - | Y |
| opensearch-embedded | Y | Y | - | Y |
| opensearch-external | Y | - | - | Y |
| no-elasticsearch, rdbms* | n/a | n/a | n/a | n/a |

### 8.9, 8.10

| persistence | ORCH | OPERATE | TASKLIST | OPTIMIZE |
|---|---|---|---|---|
| elasticsearch, elasticsearch-self-signed, no-elasticsearch, rdbms* | - | - | - | - |
| elasticsearch-external | Y | - | - | Y |
| opensearch | Y | - | - | Y |
| opensearch-embedded | Y | Y | - | Y |
| opensearch-external | Y | - | - | Y |
| elasticsearch-external-self-signed | n/a | n/a | n/a | n/a |

### Observations

- `TASKLIST_INDEX_PREFIX` is consumed only on 8.7 for Tasklist's own indices. Zeebe import indices use `ORCHESTRATION_INDEX_PREFIX`.
- `OPERATE_INDEX_PREFIX` is consumed only by `opensearch-embedded.yaml` in 8.8/8.9/8.10. It disambiguates `CAMUNDA_DATA_SECONDARYSTORAGE_OPENSEARCH_INDEXPREFIX` from `global.opensearch.prefix`, which uses `ORCHESTRATION_INDEX_PREFIX`.
- `ORCHESTRATION_INDEX_PREFIX` and `OPTIMIZE_INDEX_PREFIX` are consumed by every Elasticsearch/OpenSearch persistence layer that overrides defaults. Bundled `elasticsearch.yaml` and `elasticsearch-self-signed.yaml` rely on chart defaults and reference no prefix variables.

The prefix matrix is enforced by [`TestUpgradePrefixCoverage`](../scripts/camunda-core/pkg/scenarios/upgrade_prefix_coverage_test.go). The nightly workflow-to-config contract and cross-version upgrade prefix alignment are enforced by [`nightly_coverage_test.go`](../scripts/deploy-camunda/matrix/nightly_coverage_test.go).

## Maintenance

When `ci-test-config.yaml`, persistence YAML, or a cross-component cron nightly changes:

- Update the feature matrix to reflect the new or removed row.
- Keep `nightlyWorkflowCalls` in `scripts/deploy-camunda/matrix/nightly_coverage_test.go` in sync with cross-component nightly workflow inputs.
- Keep `prefix-key` on upgrade rows whose install leg uses a different scenario name, so both charts generate the same logical index prefixes.

Sources of truth:

| Concern | Source |
|---|---|
| Which scenarios run on PR CI per version | `charts/camunda-platform-<v>/test/ci-test-config.yaml` `.integration.case.pr.scenario[]` |
| Which nightly E2E demands a `(version, platform, scenario, shortname, flow)` | `camunda/c8-cross-component-e2e-tests` repo, `.github/workflows/playwright_sm_nightly_*.yml` |
| Which prefix variables a persistence layer references | `charts/camunda-platform-<v>/test/integration/scenarios/chart-full-setup/values/persistence/<L>.yaml` |
| How prefix env-vars are generated | `scripts/deploy-camunda/deploy/scenario.go` `generateScenarioContext()` and `scripts/deploy-camunda/deploy/values.go` `buildScenarioEnv()` |

See also: [Integration Test Scenario Resolution](./skills/integration-test-scenario-resolution.md), [GitHub Actions Workflows](./reference/github-actions-workflows.md).
