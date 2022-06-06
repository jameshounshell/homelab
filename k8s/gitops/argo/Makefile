default: create_app_secret

create_app_secret:
	kubectl -n argo create secret generic github-access --from-literal=token=$GITHUB_APP_TOKEN
