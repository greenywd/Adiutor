ARCHS = armv7 arm64
TARGET = iphone:clang:latest:latest
THEOS_BUILD_DIR = Packages

include theos/makefiles/common.mk

TWEAK_NAME = Adiutor
Adiutor_FILES = Tweak.xm UAObfuscatedString.m
Adiutor_FRAMEWORKS = UIKit Foundation CoreGraphics
Adiutor_PRIVATE_FRAMEWORKS = VoiceTrigger

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard" || "killall -9 backboardd"
SUBPROJECTS += adiutor
include $(THEOS_MAKE_PATH)/aggregate.mk
