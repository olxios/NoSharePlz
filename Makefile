ARCHS = armv7 arm64

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = NoSharePlz
NoSharePlz_FILES = NoSharePlz.xm
NoSharePlz_FRAMEWORKS = UIKit

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"
