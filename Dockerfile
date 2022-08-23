ARG BUILD_IMAGE=mcr.microsoft.com/windows/servercore:1809

FROM $BUILD_IMAGE as build
ARG STUNNEL_VERSION=5.65

USER ContainerAdministrator

RUN mkdir "C:\Users\ContainerAdministrator\stunnel"

WORKDIR C:\\Users\\ContainerAdministrator\\stunnel

RUN curl -fSLo stunnel_installer.exe https://www.stunnel.org/downloads/stunnel-%STUNNEL_VERSION%-win64-installer.exe \
 && stunnel_installer.exe /S \
 && del stunnel_installer.exe

COPY stunnel.conf WriteConfig.ps1 ./

CMD powershell -File .\WriteConfig.ps1
