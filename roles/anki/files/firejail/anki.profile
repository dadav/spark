# Firejail profile for default
# This file is overwritten after every install/update
# Persistent local customizations
include /etc/firejail/anki.local
# Persistent global definitions
include /etc/firejail/globals.local

noblacklist ${HOME}/.local/share/Anki2
noblacklist ${HOME}/.local/share/Anki
noblacklist ${HOME}/.pki

# generic gui profile
# depending on your usage, you can enable some of the commands below:

include /etc/firejail/disable-common.inc
include /etc/firejail/disable-devel.inc
include /etc/firejail/disable-passwdmgr.inc
include /etc/firejail/disable-programs.inc

include /etc/firejail/whitelist-var-common.inc

caps.drop all
ipc-namespace
netfilter
nodvd
nogroups
nonewprivs
noroot
notv
novideo
protocol unix,inet,inet6,netlink
seccomp
shell none

disable-mnt
private-dev
private-tmp

# memory-deny-write-execute
noexec ${HOME}
noexec /tmp
