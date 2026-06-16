#!/bin/sh
mkdir -p /var/lib/lxcfs
systemctl daemon-reload
systemctl enable --now lxcfs || true
