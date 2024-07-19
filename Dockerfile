FROM ubuntu:20.04

# Установите Wine
RUN dpkg --add-architecture i386 && \
    apt-get update && \
    apt-get install -y \
    wine \
    wget \
    unzip \
    && apt-get clean

# Установите рабочую директорию
WORKDIR /workspace

# Скопируйте исполняемый файл в контейнер
COPY playit-windows-x86-signed.exe /workspace/

# Запустите программу с помощью Wine
CMD ["wine", "/workspace/playit-windows-x86-signed.exe"]
