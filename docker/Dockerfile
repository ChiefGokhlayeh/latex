FROM fedora:39

LABEL name="Gokhlayeh/LaTeX"
LABEL version="v10"
LABEL description="LaTeX distribution with support for BibLaTeX and PythonTeX"
LABEL maintainer="gokhlayeh"

ARG PLANTUML_VERSION=1.2023.11
ENV PLANTUML_JAR /usr/share/java/plantuml/plantuml.jar

RUN dnf install -y --setopt=install_weak_deps=False \
  gnuplot \
  graphviz \
  inkscape \
  java-17-openjdk \
  latexmk \
  make \
  pdf2svg \
  python3 \
  texlive-scheme-full \
  && dnf clean all

RUN mkdir -p "$(dirname ${PLANTUML_JAR})" \
  && curl -SL https://github.com/plantuml/plantuml/releases/download/v${PLANTUML_VERSION}/plantuml-${PLANTUML_VERSION}.jar -o "${PLANTUML_JAR}" \
  && echo "PLANTUML_JAR=${PLANTUML_JAR}" >> /etc/environment
