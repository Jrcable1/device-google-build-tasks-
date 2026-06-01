# vendor_boot_prebuilt.mk — Use prebuilt vendor_boot.img instead of source-built.
#
# Solution: Override the vendor_boot BUILD RECIPE itself. Task files are
# included after the main Makefile, so this recipe replaces the original 
# mkbootimg recipe. Prerequisites from the original rule are still merged 
# (and built), but the recipe body becomes a simple copy operation.
#
# This way $(INSTALLED_VENDOR_BOOTIMAGE_TARGET) IS the prebuilt from the start,
# and everything downstream (target-files, OTA payload) uses the correct image.

ifdef INSTALLED_VENDOR_BOOTIMAGE_TARGET

$(INSTALLED_VENDOR_BOOTIMAGE_TARGET): device/google/OrangeFox/Fox.img
	@echo "vendor_boot: using prebuilt device/google/OrangeFox/Fox.img"
	$(hide) cp device/google/OrangeFox/Fox.img $@

endif
