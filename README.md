[![chart-ci](https://img.shields.io/github/actions/workflow/status/mariano-tp/helm-chart-skeleton/ci.yml?label=chart-ci&style=flat-square)](https://github.com/mariano-tp/helm-chart-skeleton/actions/workflows/ci.yml)
[![release](https://img.shields.io/github/v/release/mariano-tp/helm-chart-skeleton?display_name=tag&style=flat-square)](https://github.com/mariano-tp/helm-chart-skeleton/releases)
![license: MIT](https://img.shields.io/badge/license-MIT-green?style=flat-square)


# Helm Chart Skeleton

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
│   └── skeleton-app/
│       ├── Chart.yaml
│       ├── values.yaml
│       ├── templates/
│       │   ├── _helpers.tpl
│       │   ├── deployment.yaml
│       │   ├── service.yaml
│       │   ├── ingress.yaml
│       │   └── NOTES.txt
│       └── .helmignore
└── .github/
    └── workflows/
        ├── ci.yml
        └── release.yml
├── LICENSE
└── CONTRIBUTING.md
```

## Créditos
Repositorio de portfolio por @mariano-tp. Licencia MIT.
