FROM ubuntu:20.04
SHELL ["/bin/bash", "-c"]

RUN useradd apps
RUN mkdir -p /home/apps && chown apps:apps /home/apps

ENV DEBIAN_FRONTEND noninteractive
RUN apt update && apt install -y alsa-base pulseaudio pulseaudio-utils alsa-utils sox libsox-fmt-all libgstreamer1.0-dev libgstreamer-plugins-base1.0-dev libgstreamer-plugins-bad1.0-dev gstreamer1.0-plugins-base gstreamer1.0-plugins-good gstreamer1.0-plugins-bad gstreamer1.0-plugins-ugly gstreamer1.0-libav gstreamer1.0-doc gstreamer1.0-tools gstreamer1.0-x gstreamer1.0-alsa gstreamer1.0-gl gstreamer1.0-gtk3 gstreamer1.0-qt5 gstreamer1.0-pulseaudio
#for testing installing vlc
RUN apt install -y vlc

COPY Avicii.mp3 /Avicii.mp3
COPY entrypoint.sh /opt/bin/entrypoint.sh
RUN chmod 777 /opt/bin/entrypoint.sh

COPY default.pa /etc/pulse/default.pa

RUN adduser root pulse-access
RUN useradd -rm -d /home/ubuntu -s /bin/bash -g root -G sudo -u 1001 ubuntu

CMD ["bash", "/opt/bin/entrypoint.sh"]
