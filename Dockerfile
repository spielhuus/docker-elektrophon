FROM ghcr.io/spielhuus/docker-kicad-ci:v5.1.9

ENV DEBIAN_FRONTEND noninteractive

ENV WORKSPACE="/github/workspace"
ENV WWW_DIR="/github/workspace/www"

RUN apt-get update && apt-get upgrade -y &&\
    apt-get install -y build-essential unzip wget python3 python3-pip python3-dev \
                       hugo ngspice texlive texlive-latex-extra texlive-pictures \
                       texlive-science imagemagick dvisvgm vim less sudo &&\
    pip3 install \
        jupyterlab \
        nbconvert \
        pytest \
        pytest-json \
        junit-xml \
        ipytest \
        pyspice \
        schemdraw \
        sympy \
        itikz &&\
    ln -s /usr/lib/x86_64-linux-gnu/libngspice.so.0 /usr/lib/x86_64-linux-gnu/libngspice.so &&\
    wget https://github.com/spielhuus/sconstool-nbconvert/archive/refs/heads/main.zip &&\
    unzip main.zip &&\
    mkdir -p /usr/share/scons/site_scons/site_tools &&\
    mv sconstool-nbconvert-main/nbconvert /usr/share/scons/site_scons/site_tools &&\
    mv sconstool-nbconvert-main/templates/hugo /usr/local/share/jupyter/nbconvert/templates/ &&\
    apt-get purge -y build-essential unzip wget python3-pip python3-dev &&\
    apt-get autoremove -y &&\
    apt-get clean && rm -rf /var/lib/apt/lists/*

# set locale
RUN sed -i '/en_US.UTF-8/s/^# //g' /etc/locale.gen && locale-gen
ENV LANG="en_US.UTF-8" LANGUAGE="en_US:en" LC_ALL="en_US.UTF-8"

# Setup an entrypoint script
COPY entrypoint.sh /entrypoint.sh
COPY entrypoint-user.sh /entrypoint-user.sh
COPY pdf2svg /usr/bin/pdf2svg

RUN chmod 755 /entrypoint.sh
RUN chmod 755 /entrypoint-user.sh
RUN chmod 755 /usr/bin/pdf2svg
ENTRYPOINT ["/entrypoint.sh"]

CMD ["/bin/bash"]
