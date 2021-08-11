#!/usr/bin/env bash

. /etc/profile
. /usr/local/bin/docker-entrypoint-functions.sh

MYUSER="${APPUSER}"
MYUID="${APPUID}"
MYGID="${APPGID}"

AutoUpgrade
ConfigureUser

if [ "${1}" == 'syncthing' ]; then
  DockLog "fix permissions on /config"
  chown -R "${MYUSER}":"${MYUSER}" /config
  chmod -R g+w /config

  RunDropletEntrypoint

  DockLog "Starting app: ${1}"
  exec su-exec "${MYUSER}" syncthing -no-browser -no-restart -gui-address=0.0.0.0:8384 -home=/config
else
  DockLog "Starting app: ${@}"
  exec "$@"
fi

