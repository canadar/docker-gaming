#!/bin/sh

set -xe

# Set the timezone
ln -snf "/usr/share/zoneinfo/${TZ}" "/etc/localtime"
echo "${TZ}" > "/etc/timezone"

# Set the group and user identifiers
groupmod --non-unique --gid "${PGID}" steam &> /dev/null
usermod --non-unique --uid "${PUID}" steam &> /dev/null

chown steam:steam /steam

#Run steam entrypoint script as steam user
exec gosu steam "$@"