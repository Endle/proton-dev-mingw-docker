FROM registry.gitlab.steamos.cloud/steamrt/soldier/sdk

RUN sed -i '/steam/d' /etc/apt/sources.list

RUN dpkg --add-architecture i386 && \
      apt-get update && \
      apt-get install -y \
        apt-transport-https ca-certificates curl gnupg2 software-properties-common \
        ccache texinfo gpgv2 gnupg2 git  \
        fontforge-nox python-debian python-pip meson libmpc-dev libmpc-dev:i386 \
        gcc g++ gcc-i686-linux-gnu g++-i686-linux-gnu binutils-i686-linux-gnu \
        gcc-mingw-w64-i686 gcc-mingw-w64-x86-64 \
        g++-mingw-w64-i686 g++-mingw-w64-x86-64 && \
        pip install afdko



RUN      update-alternatives --set x86_64-w64-mingw32-gcc `which x86_64-w64-mingw32-gcc-posix`
RUN      update-alternatives --set x86_64-w64-mingw32-g++ `which x86_64-w64-mingw32-g++-posix`
RUN      update-alternatives --set i686-w64-mingw32-gcc `which i686-w64-mingw32-gcc-posix`
RUN      update-alternatives --set i686-w64-mingw32-g++ `which i686-w64-mingw32-g++-posix`



RUN cd /tmp && git clone https://github.com/ValveSoftware/Proton.git proton --depth=1 && \
    cd proton && \
    sh build-mingw-w64.sh


