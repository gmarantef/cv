# cv

CV de Guillermo Marante Freire en formato Markdown, versionado en Git y
exportable a PDF con Pandoc.

---

## Contenido

```
cv/
├── cv-es.md       # CV en español
├── cv-en.md       # CV en inglés
├── render.sh      # Script de generación de PDFs
├── contact.yml    # Datos privados de contacto
└── .gitignore
```

---

## Flujo de trabajo

### 1. Configurar contacto

Crea el fichero `contact.yml` (excluido del repo) con tus datos:

```yaml
phone: "+34 XXX XXX XXX"
email: "tu@email.com"
```

### 2. Editar el CV

Modifica `cv-es.md` o `cv-en.md` directamente. Los campos de contacto usan los placeholders `{{phone}}` y `{{email}}`.

### 3. Generar los PDFs

```bash
chmod +x render.sh
./render.sh
```

Los PDFs `cv-es.pdf` y `cv-en.pdf` se generan en el mismo directorio.

---

## Dependencias

- [Pandoc](https://pandoc.org/installing.html)
- [wkhtmltopdf](https://wkhtmltopdf.org/)
- [yq](https://github.com/mikefarah/yq)

```bash
# macOS
brew install pandoc wkhtmltopdf yq

# Ubuntu/Debian
sudo apt install pandoc wkhtmltopdf yq
```