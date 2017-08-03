
CONFIG_PATH=/data/options.json
TTS_BLUETOOTH_SPEAKER_PATH=/etc/tts_bluetooth_speaker.py

if [ -f /var/run/dbus.pid ]; then
	rm /var/run/dbus.pid # in case shutdown abruptly
fi

if [ ! -d /config/custom_components/media_player/ ]; then
	echo "Creating the custom components, media player directory"
	mkdir -p /config/custom_components/media_player
	cp $TTS_BLUETOOTH_SPEAKER_PATH /config/scripts/tts_bluetooth_speaker.py
fi

MAC_ADDRESS=$(jq --raw-output ".mac_address" $CONFIG_PATH)

echo "Launching bluetoothctl…"
bluetoothctl <<EOF
connect $MAC_ADDRESS
EOF
