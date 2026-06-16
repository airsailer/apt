#!/bin/sh

systemctl daemon-reload
apparmor_parser -r -W -T /etc/apparmor.d/lxc-containers || true
systemctl enable --now lxc-net lxc lxc-monitord || true
