#
# Copyright (C) 2021 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit some common awaken stuff.
$(call inherit-product, vendor/awaken/config/common_full_phone.mk)

# Inherit from device makefile
$(call inherit-product, device/xiaomi/munch/device.mk)

# Include GMS by default, but rely on environment variable just in case we don't want to build with GMS conditionally
ifneq ($(NO_GMS),true)
$(call inherit-product-if-exists, vendor/gapps/arm64/arm64-vendor.mk)
endif

#Set Boot animation Resolution
TARGET_BOOT_ANIMATION_RES := 1080

# GApps
TARGET_GAPPS_ARCH := arm64
USE_GAPPS := true

# Google Recorder
TARGET_SUPPORTS_GOOGLE_RECORDER := true

# Google Assistant
TARGET_SUPPORTS_NEXT_GEN_ASSISTANT := true

TARGET_SUPPORTS_CALL_RECORDING := true

PRODUCT_NAME := awaken_munch
PRODUCT_DEVICE := munch
PRODUCT_MANUFACTURER := Xiaomi
PRODUCT_BRAND := POCO
PRODUCT_MODEL := POCO F4

PRODUCT_GMS_CLIENTID_BASE := android-xiaomi

PRODUCT_BUILD_PROP_OVERRIDES += \
   PRIVATE_BUILD_DESC="missi-user 12 SKQ1.211006.001 V13.0.5.0.SLMMIXM release-keys"

BUILD_FINGERPRINT := Redmi/munch/munch:12/RKQ1.211001.001/V13.0.5.0.SLMMIXM:user/release-keys
