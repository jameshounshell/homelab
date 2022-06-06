default: curl_local curl_unsecure curl

tf:
	terraform apply -auto-approve

apply delete get describe:
	kustomize build . | kubectl $@ -f -

curl_unsecure:
	@echo -------------------
	curl -s http://jameshounshell.com | head -n 10

curl:
	@echo -------------------
	curl -skL https://jameshounshell.com | head -n 10

curl_local:
#	curl -HHost:jameshounshell.com https://localhost -kL
	@echo -------------------
	curl -ksL -H 'Host: jameshounshell.com' 'https://localhost' | head -n 10
# -kvL

create_cert:
	kubectl delete -n test secret jameshounshell-com --ignore-not-found
	kubectl create -n test secret tls \
		jameshounshell-com \
		--key="${HOME}/secrets/key.pem" \
		--cert="${HOME}/secrets/cert.pem"

port_forward:
	kubectl port-forward --namespace=ingress-nginx service/ingress-nginx-controller 8080:80 --address 0.0.0.0

