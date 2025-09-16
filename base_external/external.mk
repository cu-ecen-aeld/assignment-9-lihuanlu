# Include all package .mk files from this external tree
include $(sort $(wildcard $(BR2_EXTERNAL_PROJECT_BASE_PATH)/package/*/*.mk))
