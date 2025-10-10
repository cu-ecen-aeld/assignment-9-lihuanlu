##############################################################
#
# LDD
#
##############################################################

LDD_VERSION = 5492a3844a0bec0e97ff3dba5b8752bd41fd9400
LDD_SITE = git@github.com:cu-ecen-aeld/assignment-7-lihuanlu.git
LDD_SITE_METHOD = git
LDD_GIT_SUBMODULES = YES
LDD_MODULE_SUBDIRS = misc-modules scull

# Build
define LDD_BUILD_CMDS
	$(MAKE) -C $(LINUX_DIR) M=$(@D)/misc-modules $(LINUX_MAKE_FLAGS) EXTRA_CFLAGS="-I$(@D)/include" modules
	$(MAKE) -C $(LINUX_DIR) M=$(@D)/scull $(LINUX_MAKE_FLAGS) EXTRA_CFLAGS="-I$(@D)/include" modules
endef

# Install 
define LDD_INSTALL_TARGET_CMDS
    mkdir -p $(TARGET_DIR)/lib/modules/$(LINUX_VERSION_PROBED)/extra
	$(INSTALL) -m 0755 $(@D)/misc-modules/*.ko $(TARGET_DIR)/lib/modules/$(LINUX_VERSION_PROBED)/extra
	$(INSTALL) -m 0755 $(@D)/scull/*.ko $(TARGET_DIR)/lib/modules/$(LINUX_VERSION_PROBED)/extra
endef

$(eval $(kernel-module))
$(eval $(generic-package))
