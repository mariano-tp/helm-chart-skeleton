[![chart-ci](https://github.com/mariano-tp/helm-chart-skeleton/actions/workflows/chart-ci.yml/badge.svg?branch=main)](https://github.com/mariano-tp/helm-chart-skeleton/actions/workflows/chart-ci.yml)
[![release](https://img.shields.io/github/v/release/mariano-tp/helm-chart-skeleton?display_name=tag&style=flat-square)](https://github.com/mariano-tp/helm-chart-skeleton/releases)
[![license: MIT](https://img.shields.io/badge/license-MIT-green?style=flat-square)](./LICENSE)
[![last commit](https://img.shields.io/github/last-commit/mariano-tp/helm-chart-skeleton?style=flat-square)](https://github.com/mariano-tp/helm-chart-skeleton/commits/main)
[![stars](https://img.shields.io/github/stars/mariano-tp/helm-chart-skeleton?style=flat-square)](https://github.com/mariano-tp/helm-chart-skeleton/stargazers)


# Helm Chart Skeleton

Plantilla mínima para crear charts de Helm productivos: Deployment + Service + Ingress opcional, convención de `values.yaml`, y **CI en GitHub Actions** (lint + render + instalación en clúster efímero).

## Quick start (local opcional)
```bash
helm dependency update charts/skeleton-app
helm lint charts/skeleton-app
helm template demo charts/skeleton-app --values charts/skeleton-app/values.yaml
```

## Instalar (desde Releases)

Descargá el `.tgz` de la [última release](https://github.com/mariano-tp/helm-chart-skeleton/releases/latest) y ejecutá:

```bash
helm upgrade --install demo skeleton-app-0.1.0.tgz \
  --namespace demo --create-namespace

> Confirma que el nombre del `.tgz` coincide con el asset publicado en **v0.1.0**. :contentReference[oaicite:2]{index=2}
```

### Valores principales (extracto)

| Clave                       | Tipo     | Default           | Descripción                          |
|----------------------------|----------|-------------------|--------------------------------------|
| `image.repository`         | string   | `nginx`           | Imagen base del deployment           |
| `image.tag`                | string   | `stable`          | Tag de la imagen                     |
| `replicaCount`             | number   | `1`               | Réplicas del Deployment              |
| `service.type`             | string   | `ClusterIP`       | Tipo de Service                      |
| `service.port`             | number   | `80`              | Puerto del Service                   |
| `ingress.enabled`          | bool     | `false`           | Habilita Ingress                     |
| `resources.requests.cpu`   | string   | `100m`            | CPU mínima                           |
| `resources.requests.memory`| string   | `128Mi`           | Memoria mínima                       |


## CI/CD (GitHub Actions)
• chart-ci.yml
  - Instala Helm 3
  - helm lint del chart
  - helm template y sube un artefacto con los manifiestos renderizados

• chart-release.yml (on: release tag v*)
  - Empaqueta el chart y lo publica en GitHub Releases
  - Actualiza el índice en la rama gh-pages para usarlo como Helm repo


## Estructura
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

## Créditos
Repositorio de portfolio por @mariano-tp. Licencia MIT.

Ver también: [Código de Conducta](./CODE_OF_CONDUCT.md) · [Contribuir](./CONTRIBUTING.md) · [Seguridad](./SECURITY.md)
