<p align="center">
  <a href="" rel="noopener">
 <img width=200px height=200px src="img/rancher-logo-horiz-color.svg" alt="Project logo"></a>
</p>

<h3 align="center">COMO INSTALAR o RANCHER SERVER NO RANCHER DESKTOP</h3>

<div align="center">

[![Status](https://img.shields.io/badge/status-active-success.svg)]()
[![License](https://img.shields.io/badge/license-MIT-blue.svg)](/LICENSE)

</div>

---

<p align="center"> Few lines describing your project.
    <br> 
</p>

## 📝 Table of Contents

- [SOBRE](#sobre)
- [INSTALACAO](#instalacao)


## 🧐 About <a name = "about"></a>

Aqui vamos utilizar o NERDCTL do RANCHER DESKTOP

## 🏁 INSTALACAO <a name = "instalacao"></a>

1. Rodar o comando ```nerdctl run -d --restart=unless-stopped -p 8080:8080 rancher/server```
2. Aguardar, apos o termino, 2 min para dar tempo pra subir o rancher server

### Instalacao do Rancher Server


```
run -d --restart=unless-stopped -p 8080:8080 rancher/server
```

No meu caso deu erro com a tag --restart entao eu fiz
```
  nerdctl run -d  -p 8082:8080 rancher/server
  nerdctl container ls
```

<p align="center">
  <a href="" rel="noopener">
 <img   src="img/01-rancher-server.png" alt="Project logo"></a>
</p>