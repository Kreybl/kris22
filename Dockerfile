# Используем Kali Linux в качестве базового образа
FROM kalilinux/kali-rolling

# Установите необходимые зависимости
RUN apt-get update && \
    apt-get install -y \
    wget \
    unzip \
    wine \
    python3 \
    python3-pip \
    && apt-get clean

# Настройте рабочую директорию
WORKDIR /workspace

# Копируйте файлы в контейнер
COPY . /workspace

# Сделайте ваш Windows-файл исполняемым (необходимо для Windows-файлов, работающих через Wine)
RUN chmod +x /workspace/playit-windows-x86-signed.exe

# Установите точки входа
CMD ["wine", "/workspace/playit-windows-x86-signed.exe"]
