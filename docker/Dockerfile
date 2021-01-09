FROM alpine:edge

LABEL name="Gokhlayeh/LaTeX"
LABEL version="v3"
LABEL description="LaTeX distribution with support for BibLaTeX and PythonTeX"
LABEL maintainer="gokhlayeh"

ENV PLANTUML_VERSION 1.2020.26
ENV PLANTUML_JAR /usr/share/java/plantuml/plantuml.jar

RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/testing" >>/etc/apk/repositories \
  && apk add --no-cache \
  biber \
  biblatex \
  curl \
  ghostscript \
  graphviz \
  make \
  ncurses \
  openjdk11-jre \
  py3-pygments \
  python3 \
  texlive-full \
  ttf-droid \
  ttf-droid-nonlatin \
  && mkdir -p "$(dirname ${PLANTUML_JAR})" \
  && curl -fsSL https://sourceforge.net/projects/plantuml/files/plantuml.${PLANTUML_VERSION}.jar/download -o "${PLANTUML_JAR}" \
  && echo "PLANTUML_JAR=${PLANTUML_JAR}" >> /etc/environment \
  && apk del --no-cache curl

RUN ln -s python3 /usr/bin/python
COPY plantuml /usr/bin/plantuml
RUN chmod +x /usr/bin/plantuml
