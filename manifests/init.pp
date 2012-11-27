# == Class: localaccounts
#
# Create local users and groups.
#
# === Parameters
#
# [*groups*]
#   Hiera hash of the form: <groupname>: { gid: <gidnumber> }
#
# [*users*]
#   Hiera hash of the form: <username>: { uid: <uidnumber>, gid: gidnumber,
#                                         comment: <gecos> }
#
# [*sshkeys*]
#   Hiera hash of the form: <name>: { key: <key>, type: <type>, user: <user> }
#
# === Examples
#
#  include localaccounts
#
# === Requires
#
# === Authors
#
# Andrew Leonard
#
# === Copyright
#
# Copyright 2012 Andrew Leonard, Seattle Biomedical Research Institute
#
class localaccounts(
  $groups = {},
  $users = {},
  $sshkeys = {}
  ) {

  $defaults = { ensure => present }

  $user_defaults = {
    ensure => present,
    managehome => true,
    shell => '/bin/bash' }

  create_resources(group, $groups, $defaults)

  create_resources(user, $users, $user_defaults)

  create_resources(ssh_authorized_key, $sshkeys, $defaults)
}
