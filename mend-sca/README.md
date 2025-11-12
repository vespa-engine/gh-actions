# Mend Dependency Scan Action

## Usage

```yaml
- uses: vespa-engine/gh-actions/mend-sca@main
  with:
    mend-app-name: "vespa-engine"
    mend-project-name: "MyProject"  # Optional
    mend-api-key: ${{ secrets.MEND_API_KEY }}
    mend-user: ${{ secrets.MEND_EMAIL }}
```
