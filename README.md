# simple-saas-devops-cluster-resources

Kubernetes (Kustomize) manifests for the portfolio app:
- Namespace **people**
- **MongoDB** with EBS-backed PVC (gp3) and initContainer to fix permissions
- **People API** (FastAPI) from ECR (:latest) + Service **LoadBalancer**

## Deploy locally
aws eks update-kubeconfig --region ap-south-1 --name simple-saas-devops-eks
kubectl apply -k base/
kubectl -n people get all

## CI/CD
Push to `main` triggers this repo's workflow:
- OIDC → AWS
- `kubectl apply -k base/`
- waits for rollouts
- prints `/health` of the public LoadBalancer
