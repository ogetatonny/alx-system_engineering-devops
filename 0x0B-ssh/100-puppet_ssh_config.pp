#!/usr/bin/env bash
#practice using Puppet to make changes to our configuration file
#SSH client configuration must be configured to use the private key ~/.ssh/school
#SSH client configuration must be configured to refuse to authenticate using a password

include stdlib
first_line {'turning of pwd based authentication':
  ensure  => present,
  path    => '~/.ssh/ssh_config',
  line    => 'PasswordAuthentication yes',
  replace => true
}
