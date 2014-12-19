# Copyright (C) 2014 ParanoidAndroid Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Check for target product

ifeq (venture_d852,$(TARGET_PRODUCT))

# OVERLAY_TARGET adds overlay asset source
OVERLAY_TARGET := venture_xxhdpi

# Build paprefs from sources
PREFS_FROM_SOURCE ?= false

# Inherit telephony common stuff
$(call inherit-product, vendor/venture/configs/telephony.mk)

# Include AOSPA common configuration
include vendor/venture/main.mk

# Inherit device configuration
$(call inherit-product, device/lge/d852/d852.mk)

# Device identifier. This must come after all inclusions
PRODUCT_DEVICE := d852
PRODUCT_NAME := venture_d852
PRODUCT_BRAND := LGE
PRODUCT_MODEL := LG-d852
PRODUCT_MANUFACTURER := lge

PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_DEVICE="g3" PRODUCT_NAME="g3_ca" BUILD_FINGERPRINT="lge/g3_ca/g3:4.4.2/KVT49L.d85210c/d85210b.1403267110:user/release-keys" PRIVATE_BUILD_DESC="g3_ca-user 4.4.2 KVT49L.d85210c d85210b.1403267110 release-keys"

endif
