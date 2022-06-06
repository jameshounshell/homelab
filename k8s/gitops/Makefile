default: diff

apply delete get describe diff:
	kustomize build --enable-helm . | kubectl $@ -f -