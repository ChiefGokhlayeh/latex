FROM fedora:34

LABEL name="Gokhlayeh/LaTeX"
LABEL version="v6"
LABEL description="LaTeX distribution with support for BibLaTeX and PythonTeX"
LABEL maintainer="gokhlayeh"

ARG PLANTUML_VERSION=1.2021.9
ENV PLANTUML_JAR /usr/share/java/plantuml/plantuml.jar

RUN dnf install -y --setopt=install_weak_deps=False \
  graphviz \
  inkscape \
  java-latest-openjdk \
  latexmk \
  make \
  python3 \
  texlive-scheme-full \
  && dnf clean all

RUN mkdir -p "$(dirname ${PLANTUML_JAR})" \
  && curl -SL https://sourceforge.net/projects/plantuml/files/plantuml.${PLANTUML_VERSION}.jar/download -o "${PLANTUML_JAR}" \
  && echo "PLANTUML_JAR=${PLANTUML_JAR}" >> /etc/environment
