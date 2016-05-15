#!/bin/bash

### SETTINGS ##############################################################
touchpadID=$(xinput --list --id-only  "AlpsPS/2 ALPS DualPoint TouchPad")
redJoystickID=$(xinput --list --id-only  "AlpsPS/2 ALPS DualPoint Stick")
touchscreenID=$(xinput --list --id-only  "Wacom Co.,Ltd. Pen and multitouch sensor Finger touch")
penID=$(xinput --list --id-only  "Wacom Co.,Ltd. Pen and multitouch sensor Pen stylus")

APPNAME="Pen&Touch"
# To find names or IDs of the devices, run `xinput`.
###########################################################################

xinputSet="xinput --set-prop"


notifyUser() {
	notify-send "$APPNAME" "$1"
}

initHardware() {
	# commented stuff was used in Ubuntu 14.04
	# init touchpad
	#$xinputSet $touchpadID "Synaptics Palm Detection" 1
	#$xinputSet $touchpadID "Synaptics Locked Drags" 1
	#$xinputSet $touchpadID "Synaptics Locked Drags Timeout" 500
	#$xinputSet $touchpadID "Synaptics Palm Dimensions" 10 50
	#$xinputSet $touchpadID "Synaptics Click Action" 1 3 2
	#$xinputSet $touchpadID "Synaptics Middle Button Timeout" 500
	synclient TapButton3=2	# 3 finger tap = mouse wheel pressed
	# init stick
	$xinputSet $redJoystickID "Device Accel Velocity Scaling" 14.00
	#$xinputSet $redJoystickID "Device Accel Adaptive Deceleration" 1
	$xinputSet $redJoystickID "Device Accel Constant Deceleration" 0.5

	notifyUser "Pen&Touch initialized."
}

penMode() {
	# Pen on, touch off, notify
	# not tested since Ubuntu 16.04 works mostly fine now.
	$xinputSet $penID "Device Enabled" 1
	$xinputSet $touchscreenID "Device Enabled" 0
	notifyUser "Pen mode enabled"
}

hybridMode() {
	# Pen on, touch on, notify
	# not tested since Ubuntu 16.04 works mostly fine now.
	$xinputSet $penID "Device Enabled" 1
	$xinputSet $touchscreenID "Device Enabled" 1
	notifyUser "Hybrid mode enabled"
}

if [ "$1" = "pen" ]
then
	initHardware
	penMode
elif [ "$1" = "hybrid" ]
then
	initHardware
	hybridMode
else
	initHardware
fi

