{{/*
Nombre corto del chart (por convención: .Chart.Name)
*/}}
{{- define "skeleton-app.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Nombre completo (con release) p.e. myrel-skeleton-app
*/}}
{{- define "skeleton-app.fullname" -}}
{{- if .Values.fullnameOverride -}}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains .Release.Name $name -}}
{{- .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{/*
Labels comunes
*/}}
{{- define "skeleton-app.labels" -}}
app.kubernetes.io/name: {{ include "skeleton-app.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
helm.sh/chart: {{ .Chart.Name }}-{{ .Chart.Version | replace "+" "_" }}
{{- end -}}

{{/* ---------- ALIASES de compatibilidad ---------- */}}
{{- define "skeleton.name" -}}{{ include "skeleton-app.name" . }}{{- end -}}
{{- define "skeleton.fullname" -}}{{ include "skeleton-app.fullname" . }}{{- end -}}
{{- define "skeleton.labels" -}}{{ include "skeleton-app.labels" . }}{{- end -}}
