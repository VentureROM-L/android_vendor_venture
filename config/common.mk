PRODUCT_BRAND ?= venture

ifeq ($(PRODUCT_GMS_CLIENTID_BASE),)
PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.clientidbase=android-google
else
PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.clientidbase=$(PRODUCT_GMS_CLIENTID_BASE)
endif

# general properties
PRODUCT_PROPERTY_OVERRIDES += \
    keyguard.no_require_sim=true \
    ro.url.legal=http://www.google.com/intl/%s/mobile/android/basic/phone-legal.html \
    ro.com.android.wifi-watchlist=GoogleGuest \
    ro.setupwizard.enterprise_mode=1 \
    ro.com.android.dateformat=MM-dd-yyyy \
    ro.com.android.dataroaming=false \
    persist.sys.root_access=1

# enable ADB authentication if not on eng build
ifneq ($(TARGET_BUILD_VARIANT),eng)
ADDITIONAL_DEFAULT_PROPERTIES += ro.adb.secure=1
endif

# Backup Tool
PRODUCT_COPY_FILES += \
    vendor/venture/prebuilt/bin/backuptool.sh:system/bin/backuptool.sh \
    vendor/venture/prebuilt/bin/backuptool.functions:system/bin/backuptool.functions \
    vendor/venture/prebuilt/bin/50-hosts.sh:system/addon.d/50-hosts.sh \
    vendor/venture/prebuilt/bin/99-backup.sh:system/addon.d/99-backup.sh \
    vendor/venture/prebuilt/bin/blacklist:system/addon.d/blacklist

# init.d support
PRODUCT_COPY_FILES += \
    vendor/venture/prebuilt/etc/00banner:system/etc/init.d/00banner \
    vendor/venture/prebuilt/bin/sysinit:system/bin/sysinit \
    vendor/venture/prebuilt/etc/init.d/07venturekernel:system/etc/init.d/07venturekernel

# Init script file with VentureROM extras
PRODUCT_COPY_FILES += \
    vendor/venture/prebuilt/etc/init.local.rc:root/init.venture.rc

# Boot Animation
PRODUCT_COPY_FILES += \
    vendor/venture/prebuilt/media/bootanimation.zip:system/media/bootanimation.zip

# Enable SIP and VoIP on all targets
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml

# Additional packages
-include vendor/venture/config/packages.mk

# Versioning
-include vendor/venture/config/version.mk

# Add our overlays
PRODUCT_PACKAGE_OVERLAYS += vendor/venture/overlay/common

# Versioning System
ANDROID_VERSION = 5.0
VENTURE_VERSION = ALPHA2

VENTURE_VERSION := $(TARGET_PRODUCT)-$(VENTURE_VERSION)-$(shell date -u +%Y%m%d)
VENTURE_MOD_VERSION := $(VENTURE_VERSION)-$(shell date -u +%Y%m%d)

PRODUCT_PROPERTY_OVERRIDES += \
    BUILD_DISPLAY_ID=$(BUILD_ID) \
    ro.venture.version=$(VENTURE_VERSION) \
    ro.mod.version=$(VENTURE_MOD_VERSION) \
