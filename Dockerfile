FROM ubuntu

# RUN apt-get update && apt-get install -y \
#     git \
#     neovim \
#     stow \
#     curl \
#     zsh \
#     build-essential \
#     ncdu

# RUN chsh -s /usr/bin/zsh

# RUN mkdir /home/code

# RUN git clone https://github.com/WonderPanda/dotfiles.git /home/code/dotfiles

# RUN rm -f ~/.bashrc

# WORKDIR /home/code/dotfiles

# RUN stow -vSt ~ stow

# RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

# WORKDIR /root
# RUN rm -f ~/.zshrc
# RUN mv .zshrc.pre-oh-my-zsh .zshrc

# RUN curl https://sh.rustup.rs -sSf | bash -s -- -y
# ENV PATH="/root/.cargo/bin:${PATH}"
# RUN cargo install zellij

# RUN curl https://get.volta.sh | bash
# RUN /root/.volta/bin/volta install node@14
# RUN /root/.volta/bin/volta install node
# RUN /root/.volta/bin/volta install yarn

# # RUN volta install node

# RUN touch /root/.zsh_history
# RUN curl -LSfs https://raw.githubusercontent.com/cantino/mcfly/master/ci/install.sh | sh -s -- --git cantino/mcfly
# RUN echo 'eval "$(mcfly init zsh)"' >> .zshrc

RUN echo "cache bust 1"
RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y tzdata
RUN apt-get install -y software-properties-common
RUN add-apt-repository --yes --update ppa:ansible/ansible
RUN apt-get install -y ansible

COPY ./playbook/playbook.yml /home

WORKDIR /home
RUN ansible-playbook playbook.yml

# RUN touch /root/.bash_history

ENTRYPOINT ["tail"]
CMD ["-f","/dev/null"]