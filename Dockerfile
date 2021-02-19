FROM registry.gitlab.steamos.cloud/steamrt/soldier/sdk

RUN cd /tmp && \
    wget https://raw.githubusercontent.com/ValveSoftware/Proton/proton_5.13/build-mingw-w64.sh && \
    sudo sh build-mingw-w64.sh

