kubectl create -n istio-system secret tls \
  jameshounshell-com \
  --key="${HOME}/secrets/key.pem" \
  --cert="${HOME}/secrets/cert.pem"
