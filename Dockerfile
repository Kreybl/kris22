# Используем Kali Linux в качестве базового образа
FROM kalilinux/kali-rolling

# Обновляем репозитории и устанавливаем необходимые пакеты
RUN apt-get update && \
    apt-get install -y \
    curl \
    gnupg \
    lsb-release \
    xrdp \
    kali-desktop-xfce \
    && apt-get clean

# Настройка Xrdp
RUN echo "startxfce4" > ~/.xsession

# Настройка RDP-порта
EXPOSE 3389

# Добавляем ключ GPG и репозиторий Playit Cloud
RUN curl -SsL https://playit-cloud.github.io/ppa/key.gpg | gpg --dearmor | tee /etc/apt/trusted.gpg.d/playit.gpg >/dev/null && \
    echo "deb [signed-by=/etc/apt/trusted.gpg.d/playit.gpg] https://playit-cloud.github.io/ppa/data ./" | tee /etc/apt/sources.list.d/playit-cloud.list && \
    apt-get update

# Устанавливаем пакет playit
RUN apt-get install -y playit

# Настроим рабочую директорию
WORKDIR /workspace

# Копируем файлы в контейнер
COPY . /workspace

# Запускаем Xrdp, playit и логирование
CMD service xrdp start && \
    /usr/bin/playit > /workspace/playit.log 2>&1 & \
    tail -f /workspace/playit.log & \
    while true; do \
        sleep 15; \
        echo "Logging playit output..."; \
        tail -n 50 /workspace/playit.log; \
    done
