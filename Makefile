TARGET := iphone:clang:14.5
INSTALL_TARGET_PROCESSES = SpringBoard

export THEOS_DEVICE_IP=192.168.1.175
export FINALPACKAGE=1

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = HideDockAppSwitcher

HideDockAppSwitcher_FILES = Tweak.x
HideDockAppSwitcher_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk
