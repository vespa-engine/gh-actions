# Get info for the current job run

This GitHub Action retrieves information about the current job run, including the numeric
job id and the web URL for the job run.

## Usage

```yaml
permissions:
  contents: read
  actions: read  # Needed to get the job run info

jobs:
  get-github-job-info:
    runs-on: ubuntu-latest

    steps:
      - name: Get github job run info
        id: get-github-job-info
        uses: vespa-engine/gh-actions/get-github-job-info@main

      - name: Print job run info
        run: |
          echo "Job ID: ${{ steps.get-github-job-info.outputs.job_id }}"
          echo "Job URL: ${{ steps.get-github-job-info.outputs.web_url }}"
```
## Outputs

* `job_id`: The numeric job ID of the current job run.
* `web_url`: The web URL for the current job run.
