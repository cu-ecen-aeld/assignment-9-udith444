
##############################################################
#
# AESD-CHARDRIVER
#
##############################################################

#TODO: Fill up the contents below in order to reference your assignment 3 git contents
#AESD_CHARDRIVER_VERSION = '#COMMIT VERSION NUMBER'
AESD_CHARDRIVER_VERSION = 'main'
# Note: Be sure to reference the *ssh* repository URL here (not https) to work properly
# with ssh keys and the automated build/test system.
# Your site should start with git@github.com:
#AESD_ASSIGNMENTS_SITE = '#GITHUB REPOSITORY LINK'
AESD_CHARDRIVER_SITE = 'git@github.com:cu-ecen-aeld/assignments-3-and-later-udith444.git'
AESD_CHARDRIVER_SITE_METHOD = git
AESD_CHARDRIVER_GIT_SUBMODULES = YES

AESD_CHARDRIVER_LICENCE = GPL-2.0
AESD_CHARDRIVER_DEPENDENCIES = linux


AESD_CHARDRIVER_MODULE_SUBDIRS = aesd-char-driver

define AESD_CHARDRIVER_BUILD_CMDS

       $(MAKE)  -C $(LINUX_DIR) \
                 M=$(@D) \
                 MODULE_SUBDIRS="$(addprefix $(@D)/, $(AESD_CHARDRIVER_MODULE_SUBDIRS))" \
                 $(LINUX_MAKE_FLAGS) modules
endef

# TODO add your writer, finder and finder-test utilities/scripts to the installation steps below
define AESD_CHARDRIVER_INSTALL_TARGET_CMDS
        $(MAKE) -C $(LINUX_DIR) \
                 M=$(@D) \
                 MODULE_SUBDIRS="$(addprefix $(@D)/, $(AESD_CHARDRIVER_MODULE_SUBDIRS))" \
                 $(LINUX_MAKE_FLAGS)  \
                 INSTALL_MOD_PATH=$(TARGET_DIR) modules_install
endef

$(eval $(kernel-module))
$(eval $(generic-package))

