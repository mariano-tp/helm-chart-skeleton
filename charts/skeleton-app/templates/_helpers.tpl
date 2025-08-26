{{- define "skeleton.labels" -}}
app.kubernetes.io/name: {{ include "skeleton.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
helm.sh/chart: {{ .Chart.Name }}-{{ .Chart.Version | replace "+" "_" }}
{{- end }}

{{- define "skeleton.selectorLabels" -}}
app.kubernetes.io/name: {{ include "skeleton.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{- define "skeleton.name" -}}
{{ .Chart.Name }}
{{- end }}
