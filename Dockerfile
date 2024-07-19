# Используем базовый образ
FROM ubuntu:20.04

# Устанавливаем необходимые пакеты и добавляем репозиторий playit
RUN apt-get update && \
    apt-get install -y wget unzip gnupg curl && \
    curl -SsL https://playit-cloud.github.io/ppa/key.gpg | gpg --dearmor | tee /etc/apt/trusted.gpg.d/playit.gpg >/dev/null && \
    echo "deb [signed-by=/etc/apt/trusted.gpg.d/playit.gpg] https://playit-cloud.github.io/ppa/data ./" | tee /etc/apt/sources.list.d/playit-cloud.list && \
    apt-get update && \
    apt-get install -y playit && \
    apt-get clean

# Устанавливаем рабочую директорию
WORKDIR /workspace

# Копируем все содержимое из текущей директории в рабочую директорию контейнера
COPY . /workspace

# Устанавливаем команду по умолчанию
CMD ["playit"]
