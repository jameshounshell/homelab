Bootstrapping the k8s cluster
=============================
Remember:
This is all in the context of me serving jameshounshell.com,
if you have a different domain, grep for "jameshounshell" and replace it with your domain name


- Cloudflare
  - ensure you have a DNS pointed at your home IP
  - download an origin cert with the SANs `*.{domain}.com` and `{domain}.com`
- Router
  - Log into your home router, go to firewall settings, and port forward http and https to the home server
- Server
    - Get the host IP `ip addr` search for `192.*.*.*`
    - Update the IP in [metallb/kustomization.yaml](metallb/kustomization.yaml) in the inline config section
    - Update the [ingress](demo-app/ingress--demo.yaml) to use your dns name
    - Ensure the cert and private key exist at `~/secrets/cert.pem` and `~secrets/key.pem` from the Cloudflare step
- Kubectl 
  - Install nginx, metallb, the test-app, and the certificate using `make bootstrap`
- Verify
  - Navigate to `https://{domain}.com` and you should see the text "It worked"


Debugging
---------
- Check that the nginx ingress controller is type `LoadBalancer`, edit it, if not.
  - `kubectl edit -n nginx-system service nginx-ingress-nginx-controller`
- Check that the test-app has the correct hosts, ip and ports
    - ```shell
      kubectl get ingress -A
      # NAMESPACE   NAME   CLASS   HOSTS                                     ADDRESS             PORTS     AGE
      # test        demo   nginx   *.jameshounshell.com,jameshounshell.com   192.168.1.225   80, 443   18m
      ```