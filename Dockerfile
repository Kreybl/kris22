# Используем базовый образ
FROM ubuntu:20.04

# Установка необходимых пакетов
RUN apt-get update && \
    apt-get install -y \
    wget \
    unzip \
    && apt-get clean

# Установка рабочей директории
WORKDIR /workspace

# Копирование всех файлов из текущего каталога на хосте в контейнер
COPY . /workspace

# Убедитесь, что playit-windows-x86-signed.exe имеет права на выполнение
RUN chmod +x /workspace/playit-windows-x86-signed.exe

# Запуск приложения
CMD ["/workspace/playit-windows-x86-signed.exe"]
