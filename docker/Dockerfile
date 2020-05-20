FROM alpine:edge

LABEL description="LaTeX distribution with support for BibLaTeX and PythonTeX"
LABEL maintainer="gokhlayeh"

RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories \
    && apk add --no-cache \
    biber \
    biblatex \
    make \
    ncurses \
    perl-eval-closure \
    perl-file-homedir \
    perl-log-dispatch \
    perl-log-log4perl \
    perl-namespace-autoclean \
    perl-params-validationcompiler \
    perl-specio \
    perl-unicode-linebreak \
    perl-yaml-tiny \
    py3-pygments \
    python3 \
    texlive-full

RUN ln -s python3 /usr/bin/python
