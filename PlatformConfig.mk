# Copyright 2014 The Android Open Source Project
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

TARGET_ARCH_VARIANT := armv8-2a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_VARIANT_RUNTIME := kryo385

TARGET_2ND_ARCH_VARIANT := armv8-2a
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_VARIANT_RUNTIME := kryo385

BOARD_KERNEL_BASE        := 0x00000000
BOARD_KERNEL_PAGESIZE    := 4096
BOARD_KERNEL_TAGS_OFFSET := 0x01E00000
BOARD_RAMDISK_OFFSET     := 0x02000000

BOARD_KERNEL_CMDLINE += lpm_levels.sleep_disabled=1
BOARD_KERNEL_CMDLINE += androidboot.bootdevice=1d84000.ufshc
BOARD_KERNEL_CMDLINE += swiotlb=2048
BOARD_KERNEL_CMDLINE += service_locator.enable=1
BOARD_KERNEL_CMDLINE += msm_drm.dsi_display0=somc,default_cmd_panel:config0
BOARD_KERNEL_CMDLINE += androidboot.dynamic_partitions=true
BOARD_KERNEL_CMDLINE += androidboot.dynamic_partitions_retrofit=true
BOARD_KERNEL_CMDLINE += androidboot.boot_devices=soc/1d84000.ufshc

# Dynamic partitions (retrofit)
BOARD_SYSTEMIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_SYSTEM_EXTIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_PRODUCTIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_ODMIMAGE_FILE_SYSTEM_TYPE := ext4
TARGET_COPY_OUT_PRODUCT := product
TARGET_COPY_OUT_SYSTEM_EXT := system_ext

BOARD_SUPER_PARTITION_BLOCK_DEVICES := system vendor oem
BOARD_SUPER_PARTITION_METADATA_DEVICE := system
BOARD_SUPER_PARTITION_SIZE := 5721030656
BOARD_SUPER_PARTITION_SYSTEM_DEVICE_SIZE := 4227858432
BOARD_SUPER_PARTITION_VENDOR_DEVICE_SIZE := 1073741824
BOARD_SUPER_PARTITION_OEM_DEVICE_SIZE := 419430400

BOARD_SUPER_PARTITION_GROUPS := qti_dynamic_partitions
BOARD_QTI_DYNAMIC_PARTITIONS_PARTITION_LIST := odm product system system_ext vendor
BOARD_QTI_DYNAMIC_PARTITIONS_SIZE := 5716836352 # (BOARD_SUPER_PARTITION_SIZE - 4194304)

# Serial console
#BOARD_KERNEL_CMDLINE += earlycon=msm_geni_serial,0xa84000 restore_msm_uart=0x03404000

TARGET_RECOVERY_WIPE := $(PLATFORM_COMMON_PATH)/rootdir/recovery.wipe
TARGET_RECOVERY_FSTAB ?= $(PLATFORM_COMMON_PATH)/rootdir/vendor/etc/fstab.tama

# SELinux
BOARD_VENDOR_SEPOLICY_DIRS += $(PLATFORM_COMMON_PATH)/sepolicy_platform

# Build a separate vendor.img
TARGET_COPY_OUT_VENDOR := vendor
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_VENDORIMAGE_JOURNAL_SIZE := 0
BOARD_VENDORIMAGE_EXTFS_INODE_COUNT := 4096

BOARD_AVB_ENABLE := true
BOARD_AVB_MAKE_VBMETA_IMAGE_ARGS += --flag 3
TARGET_NO_RECOVERY := true
BOARD_USES_RECOVERY_AS_BOOT := true

# This platform has a metadata partition: declare this
# to create a mount point for it
BOARD_USES_METADATA_PARTITION := true

# DTBO partition definitions
TARGET_NEEDS_DTBOIMAGE ?= true

include device/sony/common/CommonConfig.mk
