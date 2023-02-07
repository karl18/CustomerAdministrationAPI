<font size=3> **Installing the Chart** </font>

To install the chart with the release name my-release:

 `helm install my-release -f shared-base.yaml -f shared-development.yaml --atomic .`

<font size=3> **To run dry run test** </font>

`helm install my-release  -n default -f shared-base.yaml -f shared-development.yaml --dry-run --debug .`



<font size=3> **Uninstalling the Chart** </font>

To uninstall/delete the my-release deployment:

`helm delete my-release -n default`


<font size=3> **Rollback the release** </font>

`helm rollback my-release -n default`




<font size=3> **Common parameters** </font>



| Name               | Description                                                                       | Value |
| :----------------- | :-------------------------------------------------------------------------------- | :---- |
| .Values.name       | This is the name of chart passed with parameter `chartName` used in CICD pipeline | ""    |
| .Values.environment| This is the env name of the deployed env , used also as Datadog env annotation    | ""    |


<font size=3> **Deployment parameters** </font>

| Name                               | Description                                                                     | Value                   |
| :--------------------------------- | :------------------------------------------------------------------------------ | :---------------------- |
| .Values.deployment.enabled         | Deployment.yaml template need to be deployed or not                             | true or false           |
| .Values.deployment.minReadySeconds | Specifies the minimum number of seconds  for which a newly created Pod is Ready | optional(10)            |
| .Values.deployment.replicaCount    | Number of pods required to run                                                  | 2                       |
| .Values.deployment.strategy        | Strategy how to create, upgrade deployment                                      | RollingUpdate           |
| .Values.deployment.maxSurge        | Number of pod specified to be created while update                              | 1                       |
| .Values.deployment.maxUnavailable  | Maximum number of unavailable pods during the update                            | 0                       |
| .Values.deployment.env             | List of env variables key values                                                | []                      |
| .Values.deployment.env_fieldref    | List of referenced env variables                                                |                         |
| .Values.statefulSet.enabled        | statefulSet.yaml template need to be deployed or not                            | true or false           |
| .Values.statefulSet.minReadySeconds| Specifies the minimum number of seconds  for which a newly created Pod is Ready | optional(10)            |
| .Values.statefulSet.replicaCount   | Number of pods required to run                                                  | 2                       |
| .Values.statefulSet.updateStrategy | Strategy how to create, upgrade statefulSet                                     | RollingUpdate           |
| .Values.statefulSet.env            | List of env variables key values                                                | []                      |
| .Values.statefulSet.env_fieldref   | List of referenced env variables                                                | []                      |
| .Values.pod.annotations            | Additional annotation to the pods                                               | {}                      |
| .Values.pod.DDmetrics              | This is to enable datadog custom pod metrics                                    | true or false (default) |
| .Values.pod.DDlogs                 | This is enable or disable datadog logs                                          | true(default) or false  |
| .Values.pod.resources              | Define limits and requests for vCPU and memory                                  | {}                      |
| .Values.pod.containerPort          | Container port                                                                  | 80                      |
| .Values.pod.metricsPort            | Container metrics port                                                          | 80                      |
| .Values.pod.metricsEndpoint        | Container metrics endpoint                                                      | "metrics"               |
| .Values.pod.containerPortName      | Container port name is defined here                                             | http                    |
| .Values.autoscaling.enabled        | To enable pod autoscaling                                                       | true or false           |
| .Values.affinity.enabled           | To decide where a pod can be placed in the cluster                              | true or false           |
| .Values.affinity.nodes             | To decide where a pod can be placed in the cluster                              | []                      |
| .Values.tolerations.enabled        | Pods to schedule onto nodes with matching taints                                | true or false           |
| .Values.tolerations.key            | Key to match taint/toleration label                                             | pod                     |
| .Values.tolerations.value          | Value to match taint/toleration label                                           | ""                      |
| .Values.tolerations.operator       | Operator to match taint/toleration label                                        | Equal                   |
| .Values.tolerations.effect         | Taint effect                                                                    | NoSchedule              |
| .Values.image.registryURL          | Image repository url needs to defined here                                      | flaschenpost.azurecr.io |
| .Values.image.name                 | Image name (referred from the ACR repo in pipeline)                             | imageName               |
| .Values.image.tag                  | Image tag                                                                       | 0.1.0                   |
| .Values.volumeMount.enabled        | To enable volume mount                                                          | true or false           |
| .Values.volumeMount.path           | Container volume mount path                                                     | ""                      |
| .Values.volumeMount.readOnly       | To enable readonly mode                                                         | true or false           |
| .Values.volumeAzure.enabled        | To enable azure volume mount                                                    | true or false           |
| .Values.volume.name                | Name of volume                                                                  | ""                      |
| .Values.secretMount.enabled        | To enable secret to be mounted as a volume mount                                | true or false           |
| .Values.secretMount.data           | Sealed secret data as a list value                                              | []                      |
| .Values.secret.enabled             | To enabled secret                                                               | true or false           |
| .Values.secret.data                | List of sealed secret key value pair                                            | []                      |
| .Values.configmap.enabled          | To enable configmap                                                             | true or false           |
| .Values.configmap.data             | Configmap data key value                                                        | []                      |
| .Values.liveness.http              | Liveness and readiness probe http is enabled/disabled                           | enabled                 |
| .Values.liveness.http.lhprobe      | Liveness http probe settings                                                    | {}                      |
| .Values.liveness.http.rhprobe      | Readiness http probe settings                                                   | {}                      |
| .Values.liveness.tcp               | Liveness and readiness probe tcp is enabled/disabled                            | disabled                |
| .Values.liveness.tcp.ltprobe       | Liveness tcp probe settings                                                     | {}                      |
| .Values.liveness.tcp.rtprobe       | Readiness tcp probe settings                                                    | {}                      |


<font size=3> **Service and Service account parameters** </font>

| Name                    | Description     | Value         |
| :---------------------- | :-------------- | :------------ |
| .Values.service.enabled | Service enabled | true or false |
| .Values.service.type    | Service type    | ClusterIP     |
| .Values.service.port    | Service port    | 80            |


<font size=3> **Ingress parameters** </font>

| Name                                       | Description                          | Value                         |
| :----------------------------------------- | :----------------------------------- | :---------------------------- |
| .Values.ingress.enabled                    | To enable or disable ingress         | true or false                 |
| .Values.ingress.privateIngress.enabled     | To enable or disable private Ingress | true (default) or false       |
| .Values.ingress.privateIngress.annotations | Private ingress annotations          | {}                            |
| .Values.ingress.publicIngress.enabled      | To enable or disable public Ingress  | true or false(default)        |
| .Values.ingress.publicIngress.annotations  | Public ingress annotations           | {}                            |
| .Values.ingress.ingressHost                | Ingress host name                    | ""                            |
| .Values.ingress.main_domain                | Ingress main domain                  | flaschenpost.de or flaschen.io |


<font size=3> **HPA parameters** </font>

| Name                                                                  | Description                                                                     | Value                      |
| :-------------------------------------------------------------------- | :------------------------------------------------------------------------------ | :------------------------- |
| .Values.autoscaling.enabled                                           | Enable autoscaling for pods                                                     | true or false              |
| .Values.autoscaling.minReplicas                                       | Minimum number of replicas                                                      | 2                          |
| .Values.autoscaling.maxReplicas                                       | Max number of replicas                                                          | 5                          |
| .Values.autoscaling.targetCPUUtilizationPercentage                    | Autoscale when cpu utilisation higher than certain percentage                   | 85                         |
| .Values.autoscaling.targetMemoryUtilizationPercentage                 | Autoscale when mem utilisation higher than certain percentage                   | 85                         |
| .Values.autoscaling.external                                          | Autoscale on external metric (Datadog metric)                                   | true or false              |
| .Values.autoscaling.external.targetDatadogMetric.query                | Datadog external metric query                                                   | <_your_custom_query>       |
| .Values.autoscaling.external.targetDatadogMetric.metricName           | Custom datadog metric name                                                      | <_your_datadogmetric_name> |
| .Values.autoscaling.external.targetDatadogMetric.matchLabels.env      | Matches the env Label of the service in Datadog                                 | DD_env                     |
| .Values.autoscaling.external.targetDatadogMetric.matchLabels.service  | Matches the service Label of the service in Datadog                             | DD_servicename             |
| .Values.autoscaling.external.targetDatadogMetric.targetValue          | targetValue is the target value of the metric (as a quantity)                   | []                         |
| .Values.autoscaling.external.targetDatadogMetric.targetAverageValue   | targetAverageValue is the target per-pod value of global metric (as a quantity) | []                         | 

Note that `targetAverageValue` and `targetValue` are mutually exclusive.


<font size=3> **Azureidentity parameters** </font>

| Name                                | Description                                     | Value         |
| :---------------------------------- | :---------------------------------------------- | :------------ |
| .Values.identity.enabled            | Manged identity assignation enabled or disabled | true or false |
| .Values.identity.clientID           | Azure app registration client ID                | ""            |
| .Values.identity.resourceID         | Azure managed identity resource id              | ""            |
| .Values.prehook.identity.enabled    | Prehook MI assignation enabled or disabled      | true or false |
| .Values.prehook.identity.clientID   | Azure app registration client ID                | ""            |
| .Values.prehook.identity.resourceID | Azure managed identity resource id              | ""            |


<font size=3> **PV and PVC parameters** </font>

| Name                              | Description                     | Value                |
| :-------------------------------- | :------------------------------ | :------------------- |
| .Values.persistence.enable        | To enable persistence volume    | true or false        |
| .Values.persistence.storageSize   | Storage size in gb              | 10G                  |
| .Values.persistence.accessMode    | Disk/storage Access mode        | ReadWriteOnce        |
| .Values.persistence.fsType        | Persistence disk extension type | ext4                 |
| .Values.persistence.annotations   | Persistence volume annotation   | {}                   |
| .Values.persistence.storageClass  | Storage class                   | managed-premium/file |
| .Values.persistence.mountPath     | Path to mount the pvc           | ""                   |
| .Values.persistence.existingClaim | If there is existing claim      | ""                   |
| .Values.persistence.pdName        | Existing volume name to bound   | ""                   |


<font size=3> **Cronjob and prehook job Parameter** </font>

| Name                                       | Description                                            | Value                        |
| :----------------------------------------- | :----------------------------------------------------- | :--------------------------- |
| .Values.cronjob.enabled                    | To enable cronjob                                      | true or false                |
| .Values.cronjob.schedule                   | Cronjob schedule to run the job                        | "0 0 * * *"                  |
| .Values.cronjob.successfulJobsHistoryLimit | Job history for successful jobs                        | 1                            |
| .Values.cronjob.failedJobsHistoryLimit     | Job history for failed jobs                            | 1                            |
| .Values.cronjob.parallelism                | To run cronjob in parallel                             | 1                            |
| .Values.cronjob.DDmetrics                  | Enable datadog custom pod metrics                      | true or false                |
| .Values.cronjob.DDLogs                     | Enable datadog logs metrics                            | true or false                |
| .Values.cronjob.affinity.enabled           | To decide where a cronjob can be placed in the cluster | true or false                |
| .Values.cronjob.affinity.nodes             | To decide where a cronjob can be placed in the cluster | []                           |
| .Values.cronjob.tolerations.enabled        | Schedule onto nodes with matching taints               | true or false                |
| .Values.cronjob.tolerations.key            | Key to match taint/toleration label                    | pod                          |
| .Values.cronjob.tolerations.operator       | Value to match taint/toleration label                  | ""                           |
| .Values.cronjob.tolerations.value          | operator to match taint/toleration label               | equal                        |
| .Values.cronjob.tolerations.effect         | Taint effect                                           | NoSchedule                   |
| .Values.cronjob.command                    | Execute cronjob command/scripts                        | [""]                         |
| .Values.cronjob.resources                  | Cronjob resource allocation limits.                    | {}                           |
| .Values.cronjob.job.parallelism            | Prehook job can run in parallel                        | 1                            |
| .Values.cronjob.backoffLimit               | Number of retries before considering a Job as failed   | 3                            |
| .Values.cronjob.crons                      | List of cronjob definitions as below                   | []                           |
| .Values.cronjob.crons.name                 | Name of the cronjob                                    | - name: somecronjob          |
| .Values.cronjob.crons.command              | Command of the cronjob                                 | command: '["command_to_run"]'|
| .Values.cronjob.crons.args                 | Args of the cronjob                                    | args: '["workdir/script.sh"]'|
| .Values.cronjob.crons.schedule             | Cronlike schedule of the cronjob                       | schedule: "30 5 * * *"       |
| .Values.cronjob.restartPolicy              | This decides when can cronjob be restarted             | Never or OnFailure           |
| .Values.hooksecret.enabled                 | To enable prehook job secret                           | true or false                |
| .Values.hooksecret.data                    | Job secret data key value                              | []                           |
| .Values.prehook.job.enabled                | To enabled prehook job                                 | true or false                |
| .Values.prehook.job.crons                  | Enable this to multiple Jobs                           | true or false                |
| .Values.prehook.job.backoffLimit           | Number of retries before considering a Job as failed   | 3                            |
| .Values.prehook.job.DDmetrics              | Enable datadog custom pod metrics                      | true or false                |
| .Values.prehook.job.DDLogs                 | Enable datadog logs metrics                            | true or false                |
| .Values.prehook.job.affinity.enabled       | To decide where a cronjob can be placed in the cluster | true or false                |
| .Values.prehook.job.affinity.nodes         | To decide where a cronjob can be placed in the cluster | ""                           |
| .Values.prehook.job.tolerations.enabled    | Schedule onto nodes with matching taints               | true or false                |
| .Values.prehook.job.tolerations.key        | Key to match taint/toleration label                    | Pod                          |
| .Values.prehook.job.tolerations.operator   | Value to match taint/toleration label                  | ""                           |
| .Values.prehook.job.tolerations.value      | operator to match taint/toleration label               | equal                        |
| .Values.prehook.job.tolerations.effect     | Taint effect                                           | NoSchedule                   |
| .Values.prehook.job.restartPolicy          | This decides when can be job restarted                 | Never or OnFailure           |


<font size=3> **Prehook configmap parameters** </font>

| Name                              | Description                      | Value         |
| :-------------------------------- | :------------------------------- | :------------ |
| .Values.prehook.configmap.enabled | Prehook configmap enabled        | true or false |
| .Values.prehook.configmap.data    | prehook configmap data key value | []            |


<font size=3> **Secret, Prehook secret and Secret-mount parameters** </font>

| Name                       | Description                       | Value                         |
| :------------------------- | :-------------------------------- | :---------------------------- |
| .Values.hooksecret.enabled | To enable sealed secret creation for hook secret | true or false  |
| .Values.hooksecret.data    |  Sealed secret key value pair as an array | []                    |
