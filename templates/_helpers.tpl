{{/*
Common environment variables
*/}}
{{- define "common.environment" -}}
- name: "LOG_LEVEL"
  value: "20"
- name: "DD_SERVICE_NAME"
  value: {{ .Values.name | quote }}
- name: "DD_VERSION"
  value: "1.29.0"
- name: "DD_AGENT_HOST"
  valueFrom:
    fieldRef:
      fieldPath: status.hostIP
{{- end }}

{{/*
{{/*
Common labels
*/}}
{{- define "common.labels" -}}
app.kubernetes.io/name: {{ .Values.name | quote }}
tags.datadoghq.com/env: {{ .Values.environment | quote }}
tags.datadoghq.com/service: {{ .Values.name | quote }}
tags.datadoghq.com/version: "1.29.0"
{{- end }}

{{/*
Selector labels
*/}}
{{- define "selector.labels" -}}
app.kubernetes.io/name: {{ .Values.name | quote }}
{{- end }}

{{/*
Standard pod annotations DDmetrics
*/}}
{{- define "pod.annotations.DDmetrics" -}}
ad.datadoghq.com/{{ .Values.name }}.check_names: '["openmetrics"]'
ad.datadoghq.com/{{ .Values.name }}.init_configs: '[{}]'
ad.datadoghq.com/{{ .Values.name }}.instances: |
    [
        {
            "prometheus_url": "http://%%host%%:{{ .Values.pod.metricsPort }}/{{ .Values.pod.metricsEndpoint }}",
            "namespace": {{ .Values.name | quote }},
            "metrics": ["*"],
            "health_service_check": "true"
        }
    ]
{{- if .Values.pod.annotations.DDmetrics }}
{{toYaml .Values.pod.annotations.DDmetrics }}
{{- end }}
{{- end }}

{{/*
Standard pod annotations DDlogs
*/}}
{{- define "pod.annotations.DDlogs" -}}
ad.datadoghq.com/{{ .Values.name }}.logs: '[{"source":{{ .Values.name | quote}},"service":{{ .Values.name | quote}}}]'
{{- if .Values.pod.annotations.DDlogs }}
{{toYaml .Values.pod.annotations.DDlogs }}
{{- end }}
{{- end }}


{{/*
Standard service annotations
*/}}
{{- define "service.annotations" -}}
ingress.kubernetes.io/service-upstream: "true"
{{- if .Values.pod.annotations }}
{{toYaml .Values.pod.annotations }}
{{- end }}
{{- end }}

{{/*
Hook annotations
*/}}
{{- define "hook.annotations" -}}
helm.sh/hook: pre-install, pre-upgrade
helm.sh/hook-delete-policy: hook-succeeded, before-hook-creation
{{- end }}