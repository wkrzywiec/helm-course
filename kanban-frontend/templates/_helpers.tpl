{{/*
Global full name of the chart. In case if a variable exceeds 63 characters the remaining part will be cut-off, as some Kubernetes name fields are not allowing for a longer text. 
*/}}
{{- define "fullName" -}}
{{- default .Release.Name .Values.name | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Generic labels for each Kubernetes resource
*/}}
{{- define "labels" -}}
app.kubernetes.io/name: {{ include "fullName" . }}
app.kubernetes.io/version: {{ .Release.Name }}-{{ .Release.Revision }}
app: {{ include "fullName" . }}
group: {{ .Values.group }}
{{- end }}