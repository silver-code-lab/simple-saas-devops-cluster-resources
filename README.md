# simple-saas-devops-cluster-resources

Kubernetes manifests (Kustomize) for the portfolio app.

## Layout
- `base/` — namespace, MongoDB, People API (Service: LoadBalancer)

## Deploy (locally)
aws eks update-kubeconfig --region ap-south-1 --name simple-saas-devops-eks
kubectl apply -k base/
kubectl -n people get all

## CI/CD
- Push to `main` triggers GitHub Actions (OIDC) to `kubectl apply -k base/`.
