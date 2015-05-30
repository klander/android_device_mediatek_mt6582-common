# Copyright (C) 2015 Krossware Interactive <http://www.krossware.com>
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

$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

$(call inherit-product-if-exists, vendor/mediatek/$(TARGET_BOARD_PLATFORM)-common/$(TARGET_BOARD_PLATFORM)-common-vendor.mk)

LOCAL_PATH := device/mediatek/$(TARGET_BOARD_PLATFORM)-common
DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay

PRODUCT_TAGS += dalvik.gc.type-precise

PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/rootdir/root/init.recovery.$(TARGET_BOARD_PLATFORM).rc:root/init.recovery.$(TARGET_BOARD_PLATFORM).rc \
	$(LOCAL_PATH)/rootdir/root/init.rc:root/init.rc \
	$(LOCAL_PATH)/rootdir/root/init.$(TARGET_BOARD_PLATFORM).rc:root/init.$(TARGET_BOARD_PLATFORM).rc \
	$(LOCAL_PATH)/rootdir/root/init.project.rc:root/init.project.rc \
	$(LOCAL_PATH)/rootdir/root/init.modem.rc:root/init.modem.rc \
	$(LOCAL_PATH)/rootdir/root/init.xlog.rc:root/init.xlog.rc \
	$(LOCAL_PATH)/rootdir/root/ueventd.$(TARGET_BOARD_PLATFORM).rc:root/ueventd.$(TARGET_BOARD_PLATFORM).rc \
	$(LOCAL_PATH)/rootdir/root/init.$(TARGET_BOARD_PLATFORM).usb.rc:root/init.$(TARGET_BOARD_PLATFORM).usb.rc

PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/rootdir/configs/android.hardware.microphone.xml:system/etc/permissions/android.hardware.microphone.xml \
	$(LOCAL_PATH)/rootdir/configs/android.hardware.camera.xml:system/etc/permissions/android.hardware.camera.xml \
	frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
	frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
	frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml \
	frameworks/native/data/etc/android.hardware.bluetooth.xml:system/etc/permissions/android.hardware.bluetooth.xml \
	frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
	frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
	frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
	frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
	frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml

PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/rootdir/configs/media_codecs.xml:system/etc/media_codecs.xml \
	$(LOCAL_PATH)/rootdir/configs/media_profiles.xml:system/etc/media_profiles.xml

PRODUCT_PACKAGES += \
	Torch

PRODUCT_PACKAGES += \
	libxlog \
	lib_driver_cmd_mt66xx

PRODUCT_PACKAGES += \
	lights.$(TARGET_BOARD_PLATFORM) \
	gps.$(TARGET_BOARD_PLATFORM)

# audio
PRODUCT_PACKAGES += \
	audio.primary.$(TARGET_BOARD_PLATFORM) \
	audio.r_submix.default \
	audio_policy.default

PRODUCT_PACKAGES += \
	setup_fs \
	e2fsck

# MediaTek
PRODUCT_PROPERTY_OVERRIDES += \
	ro.mediatek.version.release=ALPS.W10.24.p0 \
	ro.mediatek.platform=MT6582 \
	ro.mediatek.chip_ver=S01 \
	ro.mediatek.version.branch=KK1.MP1 \
	ro.mediatek.version.sdk=2 \
	persist.mtk.aee.aed=on

# RIL
PRODUCT_PROPERTY_OVERRIDES += \
	ro.telephony.sim.count=2 \
	persist.radio.fd.counter=15 \
	persist.radio.fd.off.counter=5 \
	persist.radio.fd.r8.counter=15 \
	persist.radio.fd.off.r8.counter=5 \
	rild.libpath=/system/lib/mtk-ril.so \
	ril.specific.sm_cause=0 \
	ril.external.md=0 \
	ril.current.share_modem=2 \
	ril.first.md=1 \
	ril.flightmode.poweroffMD=1 \
	ril.telephony.mode=0 \
	ro.telephony.default_network=9,9 \
	ril.active.md=0 \
	ro.telephony.ril_class=MediaTekRIL \
	ril.radiooff.poweroffMD=0 \
	persist.multisim.config=dsds \
	persist.radio.multisim.config=dsds \
	persist.dsds.enabled=true \
	ro.dual.sim.phone=true

# WLAN
PRODUCT_PROPERTY_OVERRIDES += \
	persist.mtk.wcn.combo.chipid=-1 \
	wifi.direct.interface=p2p0 \
	wifi.tethering.interface=ap0 \
	wifi.interface=wlan0 \
	ro.mediatek.wlan.wsc=1 \
	ro.mediatek.wlan.p2p=1 \
	mediatek.wlan.ctia=0

# FMRadio
PRODUCT_PROPERTY_OVERRIDES += \
	fmradio.driver.enable=1

# Misc
PRODUCT_PROPERTY_OVERRIDES += \
	mux.debuglog.enable=1 \
	ro.sys.usb.mtp.whql.enable=0 \
	sys.ipo.pwrdncap=2 \
	ro.sys.usb.storage.type=mtp,adb \
	ro.sys.usb.bicr=yes \
	ro.camera.sound.forced=0 \
	ro.audio.silent=0 \
	ro.allow.mock.location=0

# Graphics
PRODUCT_PROPERTY_OVERRIDES += \
	debug.hwui.render_dirty_regions=false \
	ro.opengles.version=131072