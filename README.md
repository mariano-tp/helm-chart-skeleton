# Helm Chart Skeleton

Plantilla mínima para crear charts de Helm productivos: Deployment + Service + Ingress opcional, convención de `values.yaml`, y **CI en GitHub Actions** (lint + render + instalación en clúster efímero).

## Quick start (local opcional)
```bash
helm dependency update charts/skeleton-app
helm lint charts/skeleton-app
helm template demo charts/skeleton-app --values charts/skeleton-app/values.yaml
```

## Instalar (desde release)
# Descargar .tgz desde Releases (v0.1.0 o superior)
helm install demo skeleton-app-0.1.0.tgz \
  --namespace demo --create-namespace


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
