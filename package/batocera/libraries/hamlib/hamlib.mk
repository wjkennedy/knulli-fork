################################################################################
#
# hamlib
#
################################################################################

HAMLIB_VERSION = 4.5.5
HAMLIB_SOURCE = hamlib-$(HAMLIB_VERSION).tar.gz
HAMLIB_SITE = https://github.com/Hamlib/Hamlib/releases/download/$(HAMLIB_VERSION)
HAMLIB_LICENSE = LGPL-2.1+
HAMLIB_LICENSE_FILES = COPYING
HAMLIB_DEPENDENCIES = libusb
HAMLIB_INSTALL_STAGING = YES

$(eval $(autotools-package))
