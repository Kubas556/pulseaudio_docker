docker build -t pulseaudio-test .

docker run -it -v ~/pulseaudio_test:/files pulseaudio-test bash
