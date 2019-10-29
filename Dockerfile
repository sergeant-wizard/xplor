FROM ubuntu

ENV INSTALL_FILE=xplor-nih-2.52
ENV INSTALL_TAR=${INSTALL_FILE}-Linux_x86_64.tar.gz
ENV INSTALL_DB=${INSTALL_FILE}-db.tar.gz

WORKDIR ~/ws
COPY data/${INSTALL_TAR} ${INSTALL_TAR}
COPY data/${INSTALL_DB} ${INSTALL_DB}

RUN tar xvzf ${INSTALL_TAR}
RUN tar xvzf ${INSTALL_DB}

RUN apt-get update
RUN apt-get install -y bc dc

WORKDIR ${INSTALL_FILE}

RUN ./configure -symlinks /usr/local/bin

COPY script.py /opt/script.py
RUN xplor -py /opt/script.py
