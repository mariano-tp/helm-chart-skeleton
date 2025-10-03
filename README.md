[![chart-ci](https://img.shields.io/github/actions/workflow/status/mariano-tp/helm-chart-skeleton/chart-ci.yml?branch=main&style=flat-square&label=chart-ci)](https://github.com/mariano-tp/helm-chart-skeleton/actions/workflows/chart-ci.yml)
[![last commit](https://img.shields.io/github/last-commit/mariano-tp/helm-chart-skeleton?style=flat-square)](https://github.com/mariano-tp/helm-chart-skeleton/commits/main)
[![release](https://img.shields.io/github/v/release/mariano-tp/helm-chart-skeleton?display_name=tag&style=flat-square)](https://github.com/mariano-tp/helm-chart-skeleton/releases)
[![license: MIT](https://img.shields.io/badge/license-MIT-green?style=flat-square)](./LICENSE)
[![stars](https://img.shields.io/github/stars/mariano-tp/helm-chart-skeleton?style=flat-square)](https://github.com/mariano-tp/helm-chart-skeleton/stargazers)


# Helm Chart Skeleton

Minimal template for creating production-ready Helm charts: Deployment + Service + optional Ingress, `values.yaml` convention, and **CI in GitHub Actions** (lint + render + ephemeral cluster install).

## Quick start (local optional)
```bash
helm dependency update charts/skeleton-app
helm lint charts/skeleton-app
helm template demo charts/skeleton-app --values charts/skeleton-app/values.yaml
```

## Install (from Releases)

Download the `.tgz` from the [latest release](https://github.com/mariano-tp/helm-chart-skeleton/releases/latest) and run:

```bash
helm upgrade --install demo skeleton-app-0.1.0.tgz   --namespace demo --create-namespace

> Confirm that the `.tgz` name matches the asset published in **v0.1.0**.
```

### Main values (excerpt)

| Key                        | Type    | Default           | Description                          |
|----------------------------|---------|-------------------|--------------------------------------|
| `image.repository`         | string  | `nginx`           | Base image for the deployment        |
| `image.tag`                | string  | `stable`          | Image tag                            |
| `replicaCount`             | number  | `1`               | Number of Deployment replicas        |
| `service.type`             | string  | `ClusterIP`       | Service type                         |
| `service.port`             | number  | `80`              | Service port                         |
| `ingress.enabled`          | bool    | `false`           | Enable Ingress                       |
| `resources.requests.cpu`   | string  | `100m`            | Minimum CPU                          |
| `resources.requests.memory`| string  | `128Mi`           | Minimum memory                       |


## CI/CD (GitHub Actions)
• chart-ci.yml
  - Installs Helm 3
  - helm lint on the chart
  - helm template and uploads an artifact with rendered manifests

• chart-release.yml (on: release tag v*)
  - Packages the chart and publishes it in GitHub Releases
  - Updates the index on the gh-pages branch to use it as a Helm repo


## Structure
```
.
├── charts/
│   └── skeleton-app/
│       ├── Chart.yaml
│       ├── values.yaml
│       ├── values.schema.json
│       └── templates/
│           ├── _helpers.tpl
│           ├── deployment.yaml
│           ├── service.yaml
│           ├── ingress.yaml
│           ├── serviceaccount.yaml
│           └── NOTES.txt
└── .github/workflows/
    ├── ci.yml
    └── release.yml
```

## Credits
Portfolio repository by @mariano-tp. Licensed under MIT.

See also: [Code of Conduct](./CODE_OF_CONDUCT.md) · [Contributing](./CONTRIBUTING.md) · [Security](./SECURITY.md)

