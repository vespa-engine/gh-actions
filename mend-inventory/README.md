# Mend Project Inventory Action

Fetches the OS Inventory ("due diligence" library/license list) for a Mend project via the v2 REST API and writes it as JSON.

## Usage

```yaml
- uses: vespa-engine/gh-actions/mend-inventory@main
  with:
    mend-project-uuid: "<uuid-from-mend-ui-url>"
    mend-project-name: "<human-readable name>" # optional, used only in logs
    mend-api-key: ${{ secrets.MEND_ATTRIBUTION_USER_KEY }}
    mend-user: ${{ vars.MEND_ATTRIBUTION_USER_EMAIL }}
    output-path: mend-inventory.json
```

The project UUID is visible in the Mend UI URL: `…/applications/osInventory?project=<uuid>…`.
