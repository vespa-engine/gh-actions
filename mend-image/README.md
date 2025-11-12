# Mend Image Scan Action

## Usage

```yaml
- uses: vespa-engine/gh-actions/mend-image@main
  with:
    image-name: "docker.io/vespaengine/vespa:latest"
    mend-api-key: ${{ secrets.MEND_API_KEY }}
    mend-user: ${{ secrets.MEND_USER }}
    mend-app-name: "my-app-name"
    mend-project-name: "my-project-name"
```
