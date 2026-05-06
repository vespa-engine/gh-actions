# Mend Project Inventory Action

Fetches the OS Inventory ("due diligence" library/license list) for a Mend project via the v3 REST API and writes it as JSON.

## Usage

```yaml
- uses: vespa-engine/gh-actions/mend-inventory@main
  with:
    mend-project-uuid: ${{ vars.MEND_PROJECT_UUID }}
    mend-project-name: "<human-readable name>" # optional, used only in logs
    mend-api-key: ${{ secrets.MEND_ATTRIBUTION_USER_KEY }}
    mend-user: ${{ vars.MEND_ATTRIBUTION_USER_EMAIL }}
    output-path: mend-inventory.json # optional, defaults to "mend-inventory.json"
```

## Configuration

Recommended setup in the calling repo (Settings → Secrets and variables → Actions):

| Where | Name | Notes |
|---|---|---|
| **Secret** | `MEND_ATTRIBUTION_USER_KEY` | Sensitive — Mend User Key |
| **Variable** | `MEND_ATTRIBUTION_USER_EMAIL` | Email of the Mend service-account user |
| **Variable** | `MEND_PROJECT_UUID` | Per-repo Mend project UUID (not sensitive — it appears in the Mend UI URL) |

The project UUID is visible in the Mend UI URL: `…/applications/osInventory?project=<uuid>…`. If a calling workflow scans multiple Mend projects, pass the UUIDs inline (e.g. via a matrix) rather than via `vars`.
