ARCHS = armv7 arm64
TARGET = iphone:clang:latest:latest
THEOS_BUILD_DIR = Packages

include theos/makefiles/common.mk

TWEAK_NAME = ClassicSiri
ClassicSiri_FILES = Tweak.xm
ClassicSiri_FRAMEWORKS = UIKit

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard" || "killall -9 backboardd"
SUBPROJECTS += classicsiri
include $(THEOS_MAKE_PATH)/aggregate.mk
