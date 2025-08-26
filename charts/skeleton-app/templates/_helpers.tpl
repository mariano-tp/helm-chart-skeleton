{{/*
Nombre corto del app
*/}}
{{- define "skeleton-app.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Nombre completo (release-name + app)
*/}}
{{- define "skeleton-app.fullname" -}}
{{- if .Values.fullnameOverride -}}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}

{{/*
Etiquetas comunes
*/}}
{{- define "skeleton-app.labels" -}}
helm.sh/chart: {{ .Chart.Name }}-{{ .Chart.Version | replace "+" "_" }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/name: {{ include "skeleton-app.name" . }}
{{- end -}}

{{/*
Nombre del ServiceAccount
*/}}
{{- define "skeleton-app.serviceAccountName" -}}
{{- if .Values.serviceAccount.create -}}
  {{- if .Values.serviceAccount.name -}}
    {{- .Values.serviceAccount.name | trunc 63 | trimSuffix "-" -}}
  {{- else -}}
    {{- include "skeleton-app.fullname" . -}}
  {{- end -}}
{{- else -}}
  default
{{- end -}}
{{- end -}}
