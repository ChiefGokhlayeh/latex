FROM archlinux:base-devel

LABEL name="Gokhlayeh/LaTeX"
LABEL version="v3"
LABEL description="LaTeX distribution with support for BibLaTeX and PythonTeX"
LABEL maintainer="gokhlayeh"

ARG YAY_REPO=https://aur.archlinux.org/yay-git.git
ARG USER_NAME=latex
ARG USER_GROUP=latex
ARG USER_UID=1000
ARG USER_GID=1000

RUN groupadd -g "${USER_GID}" "${USER_NAME}" \
  && useradd -m -g "${USER_GID}" -u "${USER_UID}" "${USER_NAME}" \
  && echo "${USER_NAME} ALL=(ALL) NOPASSWD: ALL" >>/etc/sudoers

RUN pacman -Sy --noconfirm --needed \
  git \
  && git clone "${YAY_REPO}" /tmp/yay \
  && chgrp "${USER_NAME}" /tmp/yay \
  && chmod g+ws /tmp/yay \
  && setfacl -m u::rwx,g::rwx /tmp/yay \
  && setfacl -d --set u::rwx,g::rwx,o::- /tmp/yay \
  && cd /tmp/yay \
  && sudo -u "${USER_NAME}" makepkg -sicfC --noconfirm --needed \
  && pacman -Scc --noconfirm

RUN sudo -u "${USER_NAME}" yay -Sy --noconfirm --needed --repo \
  biber \
  ghostscript \
  inkscape \
  libxml2 \
  plantuml \
  python \
  python-pygments \
  texlive-lang \
  texlive-most \
  && sudo -u "${USER_NAME}" yay -Scc --noconfirm

RUN sudo -u "${USER_NAME}" yay -Sy --noconfirm --needed --aur \
  texlive-latexindent-meta \
  && sudo -u "${USER_NAME}" yay -Scc --noconfirm

ENV PLANTUML_JAR /usr/share/java/plantuml/plantuml.jar
