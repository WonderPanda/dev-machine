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
