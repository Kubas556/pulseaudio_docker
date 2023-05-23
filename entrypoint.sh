# Cleanup to be "stateless" on startup, otherwise pulseaudio daemon can't start
rm -rf /var/run/pulse /var/lib/pulse /root/.config/pulse

# Start pulseaudio as system wide daemon
su apps -c "pulseaudio -D --verbose --exit-idle-time=-1 --disallow-exit"