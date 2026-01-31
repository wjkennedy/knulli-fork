################################################################################
#
# rtl-sdr
#
################################################################################

RTL_SDR_VERSION = 0.6.0
RTL_SDR_SITE = $(call github,osmocom,rtl-sdr,$(RTL_SDR_VERSION))
RTL_SDR_LICENSE = GPL-2.0+
RTL_SDR_LICENSE_FILES = COPYING
RTL_SDR_DEPENDENCIES = libusb
RTL_SDR_INSTALL_STAGING = YES
RTL_SDR_CONF_OPTS = -DDETACH_KERNEL_DRIVER=ON -DINSTALL_UDEV_RULES=OFF

define RTL_SDR_INSTALL_UDEV_RULES
	mkdir -p $(TARGET_DIR)/etc/udev/rules.d
	$(INSTALL) -m 0644 -D $(@D)/rtl-sdr.rules \
		$(TARGET_DIR)/etc/udev/rules.d/20-rtl-sdr.rules
endef

RTL_SDR_POST_INSTALL_TARGET_HOOKS += RTL_SDR_INSTALL_UDEV_RULES

$(eval $(cmake-package))
