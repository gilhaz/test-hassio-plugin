FROM %%BASE_IMAGE%%

# Add env
ENV LANG C.UTF-8

# Setup base
RUN apk add --no-cache jq pulseaudio pulseaudio-module-bluetooth bluez mplayer sox libsox-fmt-mp3
RUN adduser pi pulse-access
RUN echo '' >> /etc/pulse/system.pa
RUN echo '.ifexists module-bluetooth-discover.so' >> /etc/pulse/system.pa
RUN echo 'load-module module-bluetooth-discover' >> /etc/pulse/system.pa
RUN echo '.endif' >> /etc/pulse/system.pa
RUN mkdir -p /config/custom_components/media_player

# Copy data
COPY tts_bluetooth_speaker.py custom_components/media_player/
COPY run.sh /
RUN chmod a+x /run.sh

CMD [ "/run.sh" ]
