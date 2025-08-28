# Guía de Contribución

Gracias por tu interés 🙌. Este repo está pensado para ser simple y reproducible.

## Flujo de trabajo
1. **Abrí un issue** usando la plantilla (Bug / Mejora), si aplica.
2. **Creá una rama** desde `main`:
   - `feat/<breve-descripcion>` para nuevas features
   - `fix/<breve-descripcion>` para bugs
   - `docs/...`, `ci/...` para documentación o pipelines
3. **Commits** estilo *Conventional Commits*.
4. **Pull Request**:
   - Un solo tema por PR
   - Link al issue
   - Pasar todos los checks de CI
   - Actualizar README si aplica

## Estilo / calidad
- Markdown claro en español.
- Actualizar `values.yaml` y README si se cambian defaults.
- Mantener badges consistentes.

## CI
Los PRs deben quedar en **verde**:
- `helm lint charts/<chart-name>`
- `helm template charts/<chart-name>`

## Licencia
Al contribuir aceptás que tu aporte se publica bajo **MIT** (ver `LICENSE`).
