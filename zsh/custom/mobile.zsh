if [[ -f /system/bin/hostname ]]; then
  # assume we're running on android
  alias hostname=/system/bin/hostname
fi
