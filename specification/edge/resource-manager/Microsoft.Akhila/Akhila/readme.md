# Akhila

> see https://aka.ms/autorest

This is the AutoRest configuration file for Akhila.

## Configuration

### Basic Information

```yaml
openapi-type: arm
openapi-subtype: rpaas
tag: package-2026-09-01
```

### Tag: package-2026-09-01

These settings apply only when `--tag=package-2026-09-01` is specified on the command line.

```yaml $(tag) == 'package-2026-09-01'
input-file:
  - stable/2026-09-01/akhila.json
```

---
