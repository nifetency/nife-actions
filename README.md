# Nife GitHub Action

Deploy and manage applications on [Nife](https://nife.io/) using this GitHub Action. This action wraps the `nifectl` CLI tool, enabling automated deployments, status checks, and more.

## Usage

### Deploy Application to Nife

Add a workflow file (e.g., `.github/workflows/deploy.yml`) to your repository:

```yaml
name: Deploy to Nife

on:
  push:
    branches:
      - main
      - master

jobs:
  deploy:
    name: Deploy to Nife
    runs-on: ubuntu-latest
    steps:
      - uses: actions/setup-node@v4
        with:
          node-version: 20
      
      - name: Checkout code
        uses: actions/checkout@v2
      
      - name: Deploy to Nife
        uses: nifetency/nife-actions@2.4
        env:
          NIFE_ACCESS_TOKEN: ${{ secrets.NIFE_ACCESS_TOKEN }}
        with:
          args: "deploy"
```

### Deploy Site to Nife

For site-specific deployments, create a separate workflow file (e.g., `.github/workflows/main.yml`):

```yaml
name: Deploy to Nife

on:
  push:
    branches:
      - main
      - master

jobs:
  deploy:
    name: Deploy to Nife
    runs-on: ubuntu-latest
    steps:
      - name: Checkout code
        uses: actions/checkout@v2
      
      - name: Deploy Site to Nife
        uses: nifetency/nife-actions@2.4
        env:
          NIFE_ACCESS_TOKEN: ${{ secrets.NIFE_ACCESS_TOKEN }}
        with:
          args: "site redeploy --yes"
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

### Application Commands
- **Deploy:** `args: "deploy"`
- **Status:** `args: "status"`
- **List Secrets:** `args: "secrets list"`
- **Logs:** `args: "logs"`

### Site Commands
- **Site List:** `args: "site list"`
- **Site Deploy:** `args: "site deploy"`
- **Site Redeploy:** `args: "site redeploy --yes"`
- **Site Revert:** `args: "site revert"`

## Prerequisites

1.  **Nife Account:** Sign up at [launch.nife.io](https://launch.nife.io/).
2.  **Get Access Token:** Run `nifectl auth token` locally or find it in your [Dashboard](https://launch.nife.io/.)
3.  **Store as Secret:** Add the token to your GitHub repository under **Settings > Secrets and variables > Actions > New repository secret**, naming it `NIFE_ACCESS_TOKEN`.

## Documentation

For more information on `nifectl` and available commands, visit the [Nife Documentation](https://docs.nife.io/CLI/help).
For more detailed information on GitHub Actions, check the [Deploy App with GitHub Actions](https://docs.nife.io/Quick-Start/Nife-GIT-Actions).

---

© [Nife](https://nife.io/)
