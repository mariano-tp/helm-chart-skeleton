> Available languages / Idiomas disponibles: [*English*](README.md) / [*Español*](README.ES.md)  

Back to repository: [Home](https://github.com/metorresponce/metorresponce/blob/main/README.md)

[![chart-ci](https://img.shields.io/github/actions/workflow/status/metorresponce/helm-chart-skeleton/chart-ci.yml?branch=main&style=flat-square&label=chart-ci)](https://github.com/metorresponce/helm-chart-skeleton/actions/workflows/chart-ci.yml)
[![last commit](https://img.shields.io/github/last-commit/metorresponce/helm-chart-skeleton?style=flat-square)](https://github.com/metorresponce/helm-chart-skeleton/commits/main)
[![release](https://img.shields.io/github/v/release/metorresponce/helm-chart-skeleton?display_name=tag&style=flat-square)](https://github.com/metorresponce/helm-chart-skeleton/releases)
[![license: MIT](https://img.shields.io/badge/license-MIT-green?style=flat-square)](./LICENSE)
[![stars](https://img.shields.io/github/stars/metorresponce/helm-chart-skeleton?style=flat-square)](https://github.com/metorresponce/helm-chart-skeleton/stargazers)

# Helm Chart Skeleton

Minimal template for creating production-ready Helm charts: Deployment + Service + optional Ingress, a consistent values.yaml convention, and CI in GitHub Actions (lint + render + publish artifacts).

## Validate 100% online (GitHub Actions)
Open the Actions tab and run the workflow (or push a commit).

- chart-ci (chart-ci.yml)
  - Installs Helm 3
  - Runs helm lint
  - Renders manifests via helm template
  - Uploads rendered manifests as a workflow artifact

Evidence: workflow logs + rendered manifests artifact.

## Quick start (local optional)
    helm dependency update charts/skeleton-app
    helm lint charts/skeleton-app
    helm template demo charts/skeleton-app --values charts/skeleton-app/values.yaml

## Install (from Releases)
Download the .tgz from the latest release and run:

    helm upgrade --install demo skeleton-app-0.1.0.tgz --namespace demo --create-namespace

Confirm that the .tgz filename matches the asset published in the release tag.

### Main values (excerpt)
See charts/skeleton-app/values.yaml for the full list.

| Key                         | Type    | Default     | Description                     |
|----------------------------|---------|-------------|---------------------------------|
| image.repository           | string  | nginx       | Base image for the Deployment   |
| image.tag                  | string  | stable      | Image tag                       |
| replicaCount               | number  | 1           | Number of replicas              |
| service.type               | string  | ClusterIP   | Service type                    |
| service.port               | number  | 80          | Service port                    |
| ingress.enabled            | bool    | false       | Enable Ingress                  |

## CI/CD (GitHub Actions)
- chart-ci.yml
  - Chart validation (lint + render)
  - Publishes an artifact with rendered manifests

- chart-release.yml (on: release tag v*)
  - Packages the chart and publishes it in GitHub Releases
  - Updates the index on the gh-pages branch to use it as a Helm repo

## Structure
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
        ├── chart-ci.yml
        └── chart-release.yml

## Credits
Portfolio repository by @metorresponce. Licensed under MIT.

See also: [Code of Conduct](./CODE_OF_CONDUCT.md) · [Contributing](./CONTRIBUTING.md) · [Security](./SECURITY.md)

