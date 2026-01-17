> Available languages / Idiomas disponibles: [*English*](README.md) / [*Español*](README.ES.md)

Volver al repositorio: [Home](https://github.com/mariano-tp/mariano-tp/blob/main/README.ES.md)

[![chart-ci](https://img.shields.io/github/actions/workflow/status/mariano-tp/helm-chart-skeleton/chart-ci.yml?branch=main&style=flat-square&label=chart-ci)](https://github.com/mariano-tp/helm-chart-skeleton/actions/workflows/chart-ci.yml)
[![last commit](https://img.shields.io/github/last-commit/mariano-tp/helm-chart-skeleton?style=flat-square)](https://github.com/mariano-tp/helm-chart-skeleton/commits/main)
[![release](https://img.shields.io/github/v/release/mariano-tp/helm-chart-skeleton?display_name=tag&style=flat-square)](https://github.com/mariano-tp/helm-chart-skeleton/releases)
[![license: MIT](https://img.shields.io/badge/license-MIT-green?style=flat-square)](./LICENSE)
[![stars](https://img.shields.io/github/stars/mariano-tp/helm-chart-skeleton?style=flat-square)](https://github.com/mariano-tp/helm-chart-skeleton/stargazers)

# Helm Chart Skeleton

Plantilla mínima para crear Helm charts listos para producción: Deployment + Service + Ingress opcional, una convención consistente de values.yaml y CI en GitHub Actions (lint + render + publicación de artifacts).

## Validación 100% online (GitHub Actions)
Entrá a la pestaña Actions y ejecutá el workflow (o empujá un commit).

- chart-ci (chart-ci.yml)
  - Instala Helm 3
  - Ejecuta helm lint
  - Renderiza los manifiestos con helm template
  - Sube un artifact con los manifiestos renderizados

Evidencia: logs del workflow + artifact con los manifiestos renderizados.

## Inicio rápido (local opcional)
    helm dependency update charts/skeleton-app
    helm lint charts/skeleton-app
    helm template demo charts/skeleton-app --values charts/skeleton-app/values.yaml

## Instalación (desde Releases)
Descargá el .tgz del último release y ejecutá:

    helm upgrade --install demo skeleton-app-0.1.0.tgz --namespace demo --create-namespace

Confirmá que el nombre del .tgz coincide con el asset publicado en el tag del release.

### Valores principales (extracto)
Ver charts/skeleton-app/values.yaml para la lista completa.

| Key                         | Type    | Default     | Description                     |
|----------------------------|---------|-------------|---------------------------------|
| image.repository           | string  | nginx       | Imagen base del Deployment      |
| image.tag                  | string  | stable      | Tag de la imagen                |
| replicaCount               | number  | 1           | Cantidad de réplicas            |
| service.type               | string  | ClusterIP   | Tipo de Service                 |
| service.port               | number  | 80          | Puerto del Service              |
| ingress.enabled            | bool    | false       | Habilitar Ingress               |

## CI/CD (GitHub Actions)
- chart-ci.yml
  - Validación del chart (lint + render)
  - Publica un artifact con los manifiestos renderizados

- chart-release.yml (on: release tag v*)
  - Empaqueta el chart y lo publica en GitHub Releases
  - Actualiza el index en la rama gh-pages para usarlo como repositorio Helm

## Estructura
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

## Créditos
Repositorio de portfolio por @mariano-tp. Licencia MIT.

Ver también: [Code of Conduct](./CODE_OF_CONDUCT.md) · [Contributing](./CONTRIBUTING.md) · [Security](./SECURITY.md)
