[![CI](https://img.shields.io/github/actions/workflow/status/mariano-tp/helm-chart-skeleton/helm-ci.yml?branch=main&label=helm-ci&style=flat-square)](./.github/workflows/helm-ci.yml)
[![release](https://img.shields.io/github/v/release/mariano-tp/helm-chart-skeleton?display_name=tag&style=flat-square)](../../releases)
[![license: MIT](https://img.shields.io/badge/license-MIT-green?style=flat-square)](./LICENSE)
[![last commit](https://img.shields.io/github/last-commit/mariano-tp/helm-chart-skeleton?style=flat-square)](../../commits/main)

# helm-chart-skeleton

Chart mínimo de ejemplo para demostrar **lint + render** en CI con Helm.

## Quick start (local opcional)
```bash
helm dependency update charts/my-service
helm lint charts/my-service
helm template charts/my-service --values charts/my-service/values.yaml
```

## CI (GitHub Actions)
- Instala Helm
- `helm lint charts/my-service`
- `helm template …` y sube los manifiestos renderizados como artifact

## Estructura
```
.
├── charts/
│   └── my-service/
│       ├── Chart.yaml
│       ├── values.yaml
│       ├── templates/
│       │   ├── deployment.yaml
│       │   ├── service.yaml
│       │   └── _helpers.tpl
│       └── .helmignore
├── .github/workflows/helm-ci.yml
├── LICENSE
└── CONTRIBUTING.md
```

## Créditos
Repositorio de portfolio por @mariano-tp. Licencia MIT.
