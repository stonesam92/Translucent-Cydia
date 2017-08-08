include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = translucentcydiaprefs
translucentcydiaprefs_FILES = tcyRootListController.m
translucentcydiaprefs_INSTALL_PATH = /Library/PreferenceBundles
translucentcydiaprefs_FRAMEWORKS = UIKit
translucentcydiaprefs_PRIVATE_FRAMEWORKS = Preferences

include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/translucentcydiaprefs.plist$(ECHO_END)
