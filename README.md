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
      - uses: nifetency/nifectl-actions@master
        env:
          API_TOKEN: ${{ secrets.API_TOKEN }}
        with:
          args: "deploy"
```

See the [nifectl](http://docs.nife.io/) GitHub project for more information on using `nifectl`.

## Secrets

`API_TOKEN` - **Required**. The token to use for authentication. You can find a token by running `nifectl auth token` or going to your [user settings(https://ui.app.nifetency.com)

