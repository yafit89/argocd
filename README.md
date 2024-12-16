# gh_arc
sudo yum update -y
sudo yum install -y libicu


## Argocd

kubectl create namespace argocd
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

kubectl get pods -n argocd

kubectl get secret argocd-initial-admin-secret -n argocd -o jsonpath="{.data.password}" | base64 -d

-----------------
vim argocd-pf
----
apiVersion: v1
kind: Service
metadata:
  name: argocd-pf
  namespace: argocd
spec:
  type: NodePort
  selector:
    app.kubernetes.io/name: argocd-server
  ports:
  - name: http
    protocol: TCP
    port: 80
    targetPort: 8080
    nodePort: 30080


----
kubectl apply -f argocd-pf
