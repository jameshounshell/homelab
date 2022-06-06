# https://istio.io/latest/docs/setup/additional-setup/gateway/
# https://artifacthub.io/packages/helm/istio-official/gateway
helm repo add istio https://istio-release.storage.googleapis.com/charts
helm repo update
kubectl create namespace istio-ingress
helm install istio-ingress istio/gateway -n istio-ingress

# helm delete istio-ingressgateway