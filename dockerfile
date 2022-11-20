FROM ubuntu

RUN apt update && apt install -y alsa-base pulseaudio pulseaudio-utils alsa-utils sox libsox-fmt-all gstreamer1.0-pulseaudio

COPY entrypoint.sh /opt/bin/entrypoint.sh
RUN chmod 777 /opt/bin/entrypoint.sh

COPY default.pa /etc/pulse/default.pa

RUN adduser root pulse-access
RUN useradd -rm -d /home/ubuntu -s /bin/bash -g root -G sudo -u 1001 ubuntu

CMD ["bash", "/opt/bin/entrypoint.sh"]