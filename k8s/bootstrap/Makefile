default: get

bootstrap: prefight apply

unbootstrap: delete

prefight: create_cert

create_cert:
	kubectl delete -n kube-system secret origin-cert --ignore-not-found
	kubectl create -n kube-system secret tls \
		origin-cert \
		--key="${HOME}/secrets/key.pem" \
		--cert="${HOME}/secrets/cert.pem"

apply delete get describe diff:
	kustomize build --enable-helm . | kubectl $@ -f -

# misc stuff
# ----------
port_forward:
	kubectl port-forward --namespace=ingress-nginx service/ingress-nginx-controller 8080:80 --address 0.0.0.0

tail_nginx:
	stern -A nginx

tail_metallb:
	stern -A metallb

tf:
	terraform apply -auto-approve

curl_unsecure:
	@echo -------------------
	curl -s http://jameshounshell.com | head -n 10

curl:
	@echo -------------------
	curl -s https://jameshounshell.com | head -n 10

argocd_secret:
	kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d; echo