default:

create_minio_password:
	python3 -c 'open("/tmp/password","w").write(input("type username [must be >8 chars]:\n"))'
	python3 -c 'open("/tmp/password","w").write(input("type password [must be >8 chars]:\n"))'
	kubectl -n argo create secret generic minio \
	--from-literal=rootUser=$$(cat /tmp/username) \
	--from-literal=rootPassword=$$(cat /tmp/password)
