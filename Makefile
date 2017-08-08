DEBUG = 0
GO_EASY_ON_ME = 1
TARGET_IPHONEOS_DEPLOYMENT_VERSION = 8.0
ARCHS = armv7 arm64 armv7s

include theos/makefiles/common.mk

TWEAK_NAME = TranslucentCydia
TranslucentCydia_FILES = Tweak.xm
TranslucentCydia_FRAMEWORKS = UIKit

include $(THEOS_MAKE_PATH)/tweak.mk


SUBPROJECTS += translucentcydiaprefs
include $(THEOS_MAKE_PATH)/aggregate.mk
