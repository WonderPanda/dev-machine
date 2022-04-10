FROM ubuntu:focal

RUN echo 'Provisioning...'
RUN apt-get update
RUN apt-get install -y sudo
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y tzdata
RUN apt-get install -y software-properties-common
RUN add-apt-repository --yes --update ppa:ansible/ansible
RUN apt-get install  -y ansible

RUN addgroup --gid 1000 jesse
# RUN adduser --gecos jesse --uid 1000 --gid 1000 --disabled-password jesse
RUN useradd --create-home --shell /bin/bash jesse --password "$(openssl passwd -1 password)" --uid 1000 -g 1000 -G sudo,root
RUN apt-get install -y neovim curl

USER jesse
WORKDIR /home/jesse

# uncomment to more easily work with playbook directly inside the container
# COPY --chown=jesse:jesse ./playbook ./playbook

ENTRYPOINT ["tail"]
CMD ["-f","/dev/null"]