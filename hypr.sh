#!/usr/bin/sh

# This script is what I use to run
# hyprland on my nvidia hybrid laptop

echo 'GPU? '
read gpuchoice # either intel or nvidia

if [[ $gpuchoice == "intel" ]]; then
	export __EGL_VENDOR_LIBRARY_FILENAMES="/usr/share/glvnd/egl_vendor.d/50_mesa.json"
	export __GLX_VENDOR_LIBRARY_NAME="mesa"
elif [[ $gpuchoice == "nvidia" ]]; then
	export __EGL_VENDOR_LIBRARY_FILENAMES="/usr/share/glvnd/egl_vendor.d/10_nvidia.json"
	export __NV_PRIME_RENDER_OFFLOAD=1
	export __VK_LAYER_NV_optimus=NVIDIA_only
	export __GLX_VENDOR_LIBRARY_NAME=nvidia
fi

if [[ ! -z $gpuchoice ]]; then
	exec dbus-launch --exit-with-session --sh-syntax Hyprland
else
	echo 'NO GPU SELECTED, ABORT.'
fi
