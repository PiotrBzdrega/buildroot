################################################################################
#
# komodo
#
################################################################################

KOMODO_VERSION = v1.15.9
KOMODO_SITE = $(call github,mbecker20,komodo,$(KOMODO_VERSION))
KOMODO_LICENSE = GPL-3.0
KOMODO_LICENSE_FILES = LICENSE


# Indicate the directory where the Cargo.toml is located
#KOMODO_SUBDIR = bin/periphery

KOMODO_CARGO_OPTS = -p komodo_peripher --release


################################################################################
# Define the Cargo fetch step
################################################################################
define KOMODO_CARGO_FETCH
    cd $(KOMODO_SRCDIR) && \
        PATH=$(HOST_DIR)/bin:$(PATH) $(PKG_CARGO_ENV) cargo fetch
endef

# Ensure that the dependencies are fetched after the source is synchronized
KOMODO_POST_RSYNC_HOOKS += KOMODO_APP_CARGO_FETCH


$(eval $(cargo-package))
