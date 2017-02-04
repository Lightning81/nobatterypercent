export ARCHS = armv7 arm64

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = NoBatteryPercent

NoBatteryPercent_FILES = Tweak.xm

NoBatteryPercent_FRAMEWORKS = UIKit

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"
