default: get

bootstrap: prefight apply

unbootstrap: delete

demo_ns=demo

prefight: create_cert
	kubectl create ns $(demo_ns)

create_cert:
	kubectl delete -n $(demo_ns) secret origin-cert --ignore-not-found
	kubectl create -n $(demo_ns) secret tls \
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


