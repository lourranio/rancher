Problema:

* Getting “Error: could not find a ready tiller pod” error when trying various helm commands.

* Error: could not find a ready tiller pod


Solucao: 

1. Deleta

```
# kubectl delete svc tiller-deploy -n kube-system
# kubectl delete deploy tiller-deploy -n kube-system
```

2. Instala novamente 

```
# helm init --client-only
# helm plugin install https://github.com/rimusz/helm-tiller
# helm tiller install
# helm tiller start kube-system
```

Fonte: 
1. https://www.thegeekdiary.com/error-could-not-find-a-ready-tiller-pod-helm-error/
2. https://joachim8675309.medium.com/install-helm3-helm2-on-macos-d65f61509799
