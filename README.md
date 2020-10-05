# SSH-PRIVATE-FILES Deploy action

Action to retrieve files from a remote server with scp command

## Required params

- `host`: SSH address
- `port`: SSH Port
- `user`: SSH User name
- `key`: Private key
- `remote`: Remote dir path
- `local`: local dir path

### To publish

You must generate the ssh key and publish the public pair on your host. On git secrets, publish your private key

Ex.:

```bash
ssh-keygen -t rsa -b 4096 -f ssh_publish -C <some@name>
```

## Example

```yml
name: MasterCI

on:
  push:
    branches:
      - master

jobs:
  build:
    runs-on: ubuntu-latest
    name: Build and Deploy

    steps:
      - uses: actions/checkout@master
      - name: Retrieve Private Files
        uses: dustin-affinityps/ssh-private-files@master
        with:
          host: ${{ secrets.SSH_HOST }}
          port: ${{ secrets.SSH_PORT }}
          user: ${{ secrets.SSH_USER }}
          key: ${{ secrets.SSH_KEY }}
          local: "./"
          remote: "path/to/.ssh_or_env"
```