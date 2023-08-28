# GitHub Actions for Nife

This action allows deploying and managing applications to Nife.

## Usage

```yaml
name: Deploy to Nife
on: [push]
jobs:
  deploy:
    name: Deploy proxy
    runs-on: ubuntu-latest
    steps:
      # This step checks out a copy of your repository.
      - uses: actions/checkout@v2
      # This step runs `nifectl deploy`.
      - uses: nifetency/nife-actions@1.4
        env:
          API_TOKEN: ${{ secrets.NIFE_ACCESS_TOKEN }}
        with:
          args: "deploy"
```

See the [nifectl](https://docs.nife.io/) GitHub project for more information on using `nifectl`.

## Secrets

`NIFE_ACCESS_TOKEN` - **Required**. The token to use for authentication. You can find a token by running `nifectl auth token` or going to your [user settings(https://launch.nife.io/)

