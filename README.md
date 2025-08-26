[![CI](https://img.shields.io/github/actions/workflow/status/mariano-tp/helm-chart-skeleton/ci.yml?branch=main&label=chart-ci&style=flat-square)](https://github.com/mariano-tp/helm-chart-skeleton/actions/workflows/ci.yml)
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

---

# 4) Sección “CI (qué valida)”

Tu Actions ya corren (se ven **chart-ci** y **chart-release** con ejecuciones). Sumá dos bullets explícitos al README para dejarlo clarito: :contentReference[oaicite:3]{index=3}

```md
## CI (GitHub Actions)
- `ci.yml`: instala Helm, corre `helm lint` y `helm template` y sube los manifiestos renderizados como artifact.
- `release.yml`: al crear tag `v*` empaqueta el chart (`.tgz`) y lo publica en la release.


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


## CI (GitHub Actions)
- Instala Helm
- `helm lint charts/skeleton-app`
- `helm template …` y sube los manifiestos renderizados como artifact

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
