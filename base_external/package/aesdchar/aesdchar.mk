##############################################################
#
# AESDCHAR
#
##############################################################

AESDCHAR_VERSION = 67aaa10d5b950b7cce759f08e7ed49fbb947abf6
AESDCHAR_SITE = git@github.com:cu-ecen-aeld/assignments-3-and-later-lihuanlu.git
AESDCHAR_SITE_METHOD = git
AESDCHAR_GIT_SUBMODULES = YES
AESDCHAR_MODULE_SUBDIRS = aesd-char-driver

# Build
define AESDCHAR_BUILD_CMDS
	$(MAKE) -C $(LINUX_DIR) M=$(@D)/aesd-char-driver $(LINUX_MAKE_FLAGS) modules
endef

# Install 
define AESDCHAR_INSTALL_TARGET_CMDS
    mkdir -p $(TARGET_DIR)/lib/modules/$(LINUX_VERSION_PROBED)/extra
	$(INSTALL) -m 0755 $(@D)/aesd-char-driver/*.ko $(TARGET_DIR)/lib/modules/$(LINUX_VERSION_PROBED)/extra
	$(INSTALL) -m 0755 $(@D)/aesd-char-driver/aesdchar_load $(TARGET_DIR)/usr/bin/aesdchar_load
	$(INSTALL) -m 0755 $(@D)/aesd-char-driver/aesdchar_unload $(TARGET_DIR)/usr/bin/aesdchar_unload
endef

$(eval $(kernel-module))
$(eval $(generic-package))
