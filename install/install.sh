kubectl -n istio-system get configmap istio-sidecar-injector -o yaml | sed "s/istio\/proxyv2:1.2.2/otdd\/proxyv2:1.2.2.alpha.0/g"| kubectl apply -f -
kubectl -n istio-system rollout restart deploy/istio-sidecar-injector
for i in artifacts/crd*yaml; do kubectl apply -f $i; done
kubectl apply -f otdd.yaml