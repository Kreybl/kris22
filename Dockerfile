FROM ubuntu:20.04

# Установите необходимые пакеты
RUN apt-get update && \
    apt-get install -y wget unzip && \
    apt-get clean

# Установите рабочую директорию
WORKDIR /workspace

# Копируйте файл в контейнер
COPY playit-windows-x86-signed.exe /workspace/

# Сделайте файл исполняемым
RUN chmod +x /workspace/playit-windows-x86-signed.exe

# Команда для запуска файла
CMD ["/workspace/playit-windows-x86-signed.exe"]
