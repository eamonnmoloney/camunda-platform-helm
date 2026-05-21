{{- $release := ds "release" -}}
{{- $releaseHeader := conv.ToBool (getenv "VERSION_MATRIX_RELEASE_HEADER" "true") -}}
{{- $chartDir := printf "charts/camunda-platform-%s" $release.app -}}
{{- if $releaseHeader -}}
<!-- THIS FILE IS AUTO-GENERATED, DO NOT EDIT IT MANUALLY! -->
🔙 [Back to version matrix index](../)

# Camunda {{ $release.app }} Helm Chart Version Matrix

## ToC
{{ range $chartVersion := $release.charts }}
- {{ printf "[Helm chart %s](#helm-chart-%s)" $chartVersion ($chartVersion | strings.ReplaceAll "." "") }}
{{- end }}
{{- end }}

{{- range $chartVersion := $release.charts }}
{{- $gitRef := printf "camunda-platform-%s-%s" $release.app $chartVersion -}}
{{- $vars := dict
  "app_version" $release.app
  "chart_version" $chartVersion
  "chart_images_camunda" (chartImagesCamunda $chartDir $chartVersion | strings.Trim "\n")
  "chart_images_non_camunda" (chartImagesNonCamunda $chartDir $chartVersion | strings.Trim "\n")
  "chart_images_enterprise" (chartImagesEnterprise $chartDir $chartVersion | strings.Trim "\n")
  "helm_cli_version" (helmCLIVersion $gitRef | strings.Trim " ")
}}

{{- $helmCLIVersion := ternary
  "N/A"
  (printf "[%s](https://github.com/helm/helm/releases/tag/v%s)" $vars.helm_cli_version $vars.helm_cli_version)
  (eq $vars.helm_cli_version "")
}}

{{- if $releaseHeader -}}
{{ "\n" }}
{{ printf "## Helm chart %s" $vars.chart_version }}
{{ "\n" }}
{{- end }}

{{- with $vars -}}
Supported versions:

- Camunda applications: [{{ .app_version }}](https://github.com/camunda/camunda/releases?q=tag%3A{{ .app_version }}&expanded=true)
- Camunda version matrix: [{{ .app_version }}](https://helm.camunda.io/camunda-platform/version-matrix/camunda-{{ .app_version }})
- Helm values: [{{ .chart_version }}](https://artifacthub.io/packages/helm/camunda/camunda-platform/{{ .chart_version }}#parameters)
- Helm CLI: {{ $helmCLIVersion }}

Camunda images:

{{ .chart_images_camunda }}

Non-Camunda images:

{{ .chart_images_non_camunda }}
{{- if .chart_images_enterprise }}
{{- /*
  Per-version Bitnami Enterprise guide URL:
  - 8.6 lives on unsupported.docs.camunda.io with the legacy path.
  - 8.7 keeps the legacy /setup/guides/ path on the main docs site.
  - 8.8+ uses the new /deployment/helm/configure/registry-and-images/ path.
  See https://github.com/camunda/camunda-platform-helm/issues/6217.
*/ -}}
{{- $bitnamiURL := "" -}}
{{- if eq .app_version "8.6" -}}
{{- $bitnamiURL = printf "https://unsupported.docs.camunda.io/%s/docs/self-managed/setup/guides/install-bitnami-enterprise-images/" .app_version -}}
{{- else if eq .app_version "8.7" -}}
{{- $bitnamiURL = printf "https://docs.camunda.io/docs/%s/self-managed/setup/guides/install-bitnami-enterprise-images/" .app_version -}}
{{- else -}}
{{- $bitnamiURL = printf "https://docs.camunda.io/docs/%s/self-managed/deployment/helm/configure/registry-and-images/install-bitnami-enterprise-images/" .app_version -}}
{{- end }}

Enterprise images ([Camunda Enterprise]({{ $bitnamiURL }})):

{{ .chart_images_enterprise }}
{{- end }}
{{ end }}

{{- end -}}
