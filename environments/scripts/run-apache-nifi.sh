podman network create nifi-net

# podman volume create nifi-logs-vol
# podman volume create nifi-state-vol
# podman volume create nifi-database-repository-vol
# podman volume create nifi-provenance-repository-vol
# podman volume create nifi-content-repository-vol
# podman volume create nifi-flowfile-repository-vol
podman volume create nifi-data-vol

podman run --name nifi \
  --rm \
  -p 8080:8080 \
  -d \
  -v ./nifi:/opt/nifi/nifi-current:Z \
  -e NIFI_WEB_HTTP_PORT=8080 \
  --network=nifi-net \
  apache/nifi:latest

podman volume create nifi-registry-database
podman volume create nifi-registry-extension-bundles
podman volume create nifi-registry-flow-storage

podman run --name nifi-registry \
  --rm \
  -p 18080:18080 \
  -d \
  -v nifi-registry-database:/opt/nifi-registry/nifi-registry-current/database \
  -v nifi-registry-extension-bundles:/opt/nifi-registry/nifi-registry-current/extension_bundles \
  -v nifi-registry-flow_storage:/opt/nifi-registry/nifi-registry-current/flow_storage \
  --network=nifi-net \
  apache/nifi-registry:latest