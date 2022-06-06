default:create_github_app_secret

create_github_app_secret:
	kubectl -n argo-events delete secret github-access --ignore-not-found=true
	kubectl -n argo-events create secret generic github-access\
 	--from-literal=token=$$GITHUB_PERSONAL_ACCESS_TOKEN \
 	--from-literal=secret=$$GITHUB_APP_SECRET

