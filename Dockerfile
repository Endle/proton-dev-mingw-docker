FROM registry.gitlab.steamos.cloud/steamrt/soldier/sdk

RUN cd /tmp && \
    wget https://raw.githubusercontent.com/ValveSoftware/Proton/proton_5.13/build-mingw-w64.sh && \
    head -n221 build-mingw-w64.sh | tail -n +32 > download-mingw-w64.sh && \
    sh download-mingw-w64.sh

RUN dpkg --add-architecture i386 && \
      apt-get update && apt-get install -y apt-transport-https ca-certificates curl gnupg2 software-properties-common

RUN apt-get install -y ccache texinfo gpgv2 gnupg2 git docker-ce docker-ce-cli containerd.io \
          fontforge-nox python-debian python-pip meson libmpc-dev libmpc-dev:i386 \
          gcc g++ gcc-i686-linux-gnu g++-i686-linux-gnu binutils-i686-linux-gnu \
          gcc-mingw-w64-i686 gcc-mingw-w64-x86-64 \
          g++-mingw-w64-i686 g++-mingw-w64-x86-64

RUN      update-alternatives --set x86_64-w64-mingw32-gcc `which x86_64-w64-mingw32-gcc-posix`
RUN      update-alternatives --set x86_64-w64-mingw32-g++ `which x86_64-w64-mingw32-g++-posix`
RUN      update-alternatives --set i686-w64-mingw32-gcc `which i686-w64-mingw32-gcc-posix`
RUN      update-alternatives --set i686-w64-mingw32-g++ `which i686-w64-mingw32-g++-posix`

RUN      pip install afdko



RUN cd /tmp &&    sudo sh build-mingw-w64.sh

