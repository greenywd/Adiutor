ARCHS = armv7 arm64
TARGET = iphone:clang:latest:latest

include theos/makefiles/common.mk

BUNDLE_NAME = adiutor
adiutor_FILES = $(wildcard *.mm)
adiutor_INSTALL_PATH = /Library/PreferenceBundles
adiutor_FRAMEWORKS = UIKit Social
adiutor_PRIVATE_FRAMEWORKS = Preferences MessageUI

include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/adiutor.plist$(ECHO_END)
