#!/bin/sh
systemctl stop lxcfs || true
# Unmount lazily in case it's busy
umount -l /var/lib/lxcfs || true
