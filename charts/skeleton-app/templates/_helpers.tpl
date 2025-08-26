{{/* Nombre corto del chart (con override) */}}
{{- define "skeleton-app.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/* Nombre completo (release + chart, con override) */}}
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

{{/* Labels comunes */}}
{{- define "skeleton-app.labels" -}}
app.kubernetes.io/name: {{ include "skeleton-app.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
helm.sh/chart: {{ .Chart.Name }}-{{ .Chart.Version | replace "+" "_" }}
{{- end -}}

{{/* Helper: nombre del ServiceAccount (usa override si viene) */}}
{{- define "skeleton-app.serviceAccountName" -}}
{{- if .Values.serviceAccount.name -}}
{{- .Values.serviceAccount.name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- include "skeleton-app.fullname" . -}}
{{- end -}}
{{- end -}}

{{/* Alias legacy (por si algún template usa skeleton.*) */}}
{{- define "skeleton.name" -}}{{ include "skeleton-app.name" . }}{{- end -}}
{{- define "skeleton.fullname" -}}{{ include "skeleton-app.fullname" . }}{{- end -}}
{{- define "skeleton.labels" -}}{{ include "skeleton-app.labels" . }}{{- end -}}
