FROM ubuntu:20.04

RUN apt-get update && \
    apt-get install -y qemu qemu-kvm libvirt-daemon-system libvirt-clients bridge-utils \
    && apt-get clean

# Переопределяем рабочий каталог
WORKDIR /workspace

# Копируем и устанавливаем ваши скрипты или исходные файлы
COPY . /workspace

# Команда для запуска
CMD ["bash"]
