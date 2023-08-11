FROM mysql:8.0.32

RUN microdnf update \
    && microdnf install -y hostname \
    && microdnf install -y glibc-locale-source \
    && microdnf install -y glibc-langpack-ja
ENV LANG ja_JP.UTF-8
ENV LANGUAGE ja_JP:ja
ENV LC_ALL=ja_JP.UTF-8
RUN localedef -f UTF-8 -i ja_JP ja_JP.utf8


