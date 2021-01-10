FROM fedora:33

LABEL name="Gokhlayeh/LaTeX"
LABEL version="v3"
LABEL description="LaTeX distribution with support for BibLaTeX and PythonTeX"
LABEL maintainer="gokhlayeh"

ARG PLANTUML_VERSION=1.2020.26
ENV PLANTUML_JAR /usr/share/java/plantuml/plantuml.jar

RUN dnf install -y --setopt=install_weak_deps=False \
  inkscape \
  java-latest-openjdk \
  latexmk \
  make \
  python3 \
  texlive-collection-bibtexextra \
  texlive-collection-latexextra \
  texlive-scheme-medium \
  && dnf clean all

RUN mkdir -p "$(dirname ${PLANTUML_JAR})" \
  && curl -fsSL https://sourceforge.net/projects/plantuml/files/plantuml.${PLANTUML_VERSION}.jar/download -o "${PLANTUML_JAR}" \
  && echo "PLANTUML_JAR=${PLANTUML_JAR}" >>/etc/environment
