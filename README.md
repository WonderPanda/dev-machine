# Dev Machine

## Steps

It is necessary for `ansible` to be installed before the playbook can be run

```shell
RUN add-apt-repository --yes --update ppa:ansible/ansible
RUN apt-get install -y ansible
```

```shell
curl https://codeload.github.com/WonderPanda/dev-machine/zip/refs/heads/main -o playbook-repo.zip
unzip playbook-repo.zip
mv dev-machine-main/playbook playbook
rm -rf dev-machine-main
ansible-playbook --ask-vault-pass -K playbook/playbook.yaml
```

## Setup not yet managed by Ansible

### Deb

- Chrome
- Slack
- VsCode
- Discord

### Snap

Unforunately it seems for some applications it will be easier to stick with Snap. In the case of Datagrip, due to the Flatpak sandbox the application is unable to access Postgres client binaries eg pg_restore and pg_dump which are necessary for dev work

- Datagrip: `sudo snap install datagrip --classic`
- btop: `sudo snap install btop`

## Bugs

- For some reason the symlinks for ~/.zshrc are not properly getting set up when initially invoking `stow`. Right now I am manually deleting this file and then re-running stow to establish the link to the dotfiles codebase

## Future tasks

- [ ] Install fonts (Can just be copied into ~/.fonts directory):
  - [ ] [Fantasque Sans Mono Nerd Font](https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/FantasqueSansMono)
  - [ ] Inter
  - [ ] Victor Mono
- [ ] Manage 4k fonts and scaling using `gnome-tweaks`
- [ ] Automatically set up sync using Syncthing
- [ ] Manage Pulumi installation and CLI setup
  - [ ] Include the pulumi credentials file in Ansible vault. Located at `~/.pulumi/credentials.json`
- [ ] Manage gh cli authentication and extensions. Will need to encrypt a token in the vault and then use `gh auth login --with-token < mytoken.txt`
  - [ ] Automate the installation of [gh-dash](https://github.com/dlvhdr/gh-dash)
