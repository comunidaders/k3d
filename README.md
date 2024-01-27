# Kubernetes Cluster Management Makefile

Este Makefile é utilizado para gerenciar um cluster Kubernetes usando `k3d`, instalar o Nginx Ingress Controller e o Cert-Manager, e também para deletar o cluster quando necessário.

## Pré-Requisitos

Antes de executar os comandos deste Makefile, certifique-se de que as seguintes ferramentas estejam instaladas em seu sistema:

- [k3d](https://k3d.io/): Ferramenta para executar clusters Kubernetes com k3s.
- [kubectl](https://kubernetes.io/docs/tasks/tools/): Ferramenta de linha de comando para Kubernetes.
- [Helm](https://helm.sh/): Gerenciador de pacotes para Kubernetes.
- [Docker] (https://docker.com): Docker


### k3d

k3d é uma ferramenta que facilita a execução de clusters Kubernetes com k3s em ambientes de desenvolvimento.

- **Instalação no Linux:**
  ```bash
  curl -s https://raw.githubusercontent.com/rancher/k3d/main/install.sh | bash
  ```
## Comandos Disponíveis

- `create-cluster`: Cria um cluster Kubernetes com k3d.
- `deploy-services`: Instala o Nginx Ingress Controller e o Cert-Manager no cluster.
- `delete-cluster`: Deleta o cluster criado.
- `up`: Executa `create-cluster` e `deploy-services`.
- `down`: Executa `delete-cluster`.

## Como Usar

### Criar e Configurar o Cluster

Para criar o cluster e instalar os serviços necessários (Nginx Ingress Controller e Cert-Manager), execute:
### kubctl
- **Instalação Kubectl:**
  ```bash
  curl -LO https://dl.k8s.io/release/v1.29.0/bin/linux/amd64/kubectl
  ```

### Docker
- **Instalação Docker:**
  ```bash
  curl -fsSL https://get.docker.com | bash
  ```

### Helm
- **Instalação Helm:**
  ```bash
  curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash
  ```

Start do cluster
  ```bash
  make up
  ```

Com o nome do cluster customizado

```bash
make up CLUSTERNAME=meu-cluster-personalizado
```

Para Deletar o cluster com os serviços instalados, execute:

```bash
make down
