VERSION := $(ROM_VERSION_MAJOR).$(ROM_VERSION_MINOR)

export ROM_VERSION := $(VERSION)-$(shell date -u +%Y%m%d)

PRODUCT_PROPERTY_OVERRIDES += \
    ro.modversion=$(ROM_VERSION) \
    ro.$(VENDOR).version=$(VERSION)
