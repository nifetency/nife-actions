# Nife GitHub Action

Deploy and manage applications on [Nife](https://nife.io/) using this GitHub Action. This action wraps the `nifectl` CLI tool, enabling automated deployments, status checks, and more.

## Usage

Add a workflow file (e.g., `.github/workflows/deploy.yml`) to your repository:

```yaml
name: Deploy to Nife

on:
  push:
    branches:
      - main

jobs:
  deploy:
    runs-on: ubuntu-latest
    steps:
      # This step checks out a copy of your repository
      - name: Checkout repository
        uses: actions/checkout@v2
      # This step runs `nifectl deploy`.
      - name: Deploy to Nife
        uses: nifetency/nife-actions@2.4
        env:
          NIFE_ACCESS_TOKEN: ${{ secrets.NIFE_ACCESS_TOKEN }}
        with:
          args: "deploy"
```

## Configuration

### Environment Variables

| Variable | Description | Required |
|----------|-------------|----------|
| `NIFE_ACCESS_TOKEN` | Your Nife API access token for authentication. | Yes |

### Inputs

| Input | Description | Default |
|-------|-------------|---------|
| `args` | Arguments to pass to the `nifectl` command (e.g., `deploy`, `status`). | `""` |

## Common Commands

You can use the `args` parameter to run any `nifectl` command:

- **Deploy:** `args: "deploy"`
- **Status:** `args: "status"`
- **List Secrets:** `args: "secrets list"`
- **Logs:** `args: "logs"`

## Prerequisites

1.  **Nife Account:** Sign up at [launch.nife.io](https://launch.nife.io/).
2.  **Get Access Token:** Run `nifectl auth token` locally or find it in your [Dashboard](https://launch.nife.io/.)
3.  **Store as Secret:** Add the token to your GitHub repository under **Settings > Secrets and variables > Actions > New repository secret**, naming it `NIFE_ACCESS_TOKEN`.

## Documentation

For more information on `nifectl` and available commands, visit the [Nife Documentation](https://docs.nife.io/CLI/help).
For more detailed information on GitHub Actions, check the [Deploy App with GitHub Actions](https://docs.nife.io/Deploy-App/Automation/Github-actions).

---

© [Nife](https://nife.io/)
