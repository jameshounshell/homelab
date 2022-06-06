Kubernetes Homelab with MiniKube
================================

I'm using minikube with docker because it was faster than podman+cri-o

To get started install:
- minikube
- docker
- docker-desktop
  - ```shell
    systemctl --user start docker-desktop
    systemctl --user enable docker-desktop
    ```

Then:
- `minikube start`
