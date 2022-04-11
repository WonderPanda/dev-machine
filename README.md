# Dev Machine

```shell
sudo apt-get install unzip
curl https://codeload.github.com/WonderPanda/dev-machine/zip/refs/heads/main -o playbook-repo.zip
unzip playbook-repo.zip
mv dev-machine-main/playbook playbook
rm -rf dev-machine-main
ansible-playbook --ask-vault-pass -K playbook/playbook.yaml
```
