# Dev Machine

## Steps

```shell
curl https://codeload.github.com/WonderPanda/dev-machine/zip/refs/heads/main -o playbook-repo.zip
unzip playbook-repo.zip
mv dev-machine-main/playbook playbook
rm -rf dev-machine-main
ansible-playbook --ask-vault-pass -K playbook/playbook.yaml
```

## Setup not yet managed by Ansible

### Flatpak

- Obsidian: `flatpak install flathub md.obsidian.Obsidian`
- Datagrip: `flatpak install flathub com.jetbrains.DataGrip`
- Spotify: `flatpak install flathub com.spotify.Client`
- Telegram: `flatpak install flathub org.telegram.desktop`
- Ferdi: `flatpak install flathub com.getferdi.Ferdi`

### Deb

- Chrome
- Slack
- VsCode
- Discord

### Snap

Unforunately it seems for some applications it will be easier to stick with Snap. In the case of Datagrip, due to the Flatpak sandbox the application is unable to access Postgres client binaries eg pg_restore and pg_dump which are necessary for dev work

- Datagrip: `sudo snap install datagrip --classic`
- btop: `sudo snap install btop`
