#!/vendor/bin/sh
if ! applypatch --check EMMC:/dev/block/by-name/recovery:134217728:91bf7717b037205bdae6f6545be93b554e95bd46; then
  applypatch  \
          --patch /vendor/recovery-from-boot.p \
          --source EMMC:/dev/block/by-name/boot$(getprop ro.boot.slot_suffix):67108864:22fb15978c5f8a9424e29c031775bfdf976fa8f4 \
          --target EMMC:/dev/block/by-name/recovery:134217728:91bf7717b037205bdae6f6545be93b554e95bd46 && \
      log -t recovery "Installing new recovery image: succeeded" && \
        echo "Installing new recovery image: succeeded" > /cache/recovery/last_install_recovery_status || \
      (log -t recovery "Installing new recovery image: failed" && \
        echo "Installing new recovery image: failed" > /cache/recovery/last_install_recovery_status)
else
  log -t recovery "Recovery image already installed" && \
  echo "Recovery image already installed" > /cache/recovery/last_install_recovery_status
fi
