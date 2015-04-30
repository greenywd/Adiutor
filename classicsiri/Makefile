ARCHS = armv7 arm64
#TARGET = iphone:clang:latest:latest

include theos/makefiles/common.mk

BUNDLE_NAME = ClassicSiri
ClassicSiri_FILES = $(wildcard *.mm)
ClassicSiri_INSTALL_PATH = /Library/PreferenceBundles
ClassicSiri_FRAMEWORKS = UIKit Social
ClassicSiri_PRIVATE_FRAMEWORKS = Preferences

include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/ClassicSiri.plist$(ECHO_END)
