# Overview

[Twingate](https://www.twingate.com/) provides VPN-less remote network connectivity. This project packages a twingate connector as a
daemonset to provide host network access to Twingate managed networks.

# Building

~~~
podman build . --tag your-registry/your-repo/twingate:latest
podman push your-registry/your-repo/twingate:latest
~~~

# Installing

Note: Refer to Twingate documentation for details on configuring networks and service account tokens.

~~~
oc new-project twingate
oc label --overwrite ns twingate pod-security.kubernetes.io/enforce=privileged pod-security.kubernetes.io/audit=privileged pod-security.kubernetes.io/warn=privileged security.openshift.io/scc.podSecurityLabelSync=false 
oc create sa vpn
oc adm policy add-scc-to-user privileged -z vpn
oc create -f credentials.json
oc create -f ds.yaml
~~~

