# Ensure the stdlib and apt modules are installed
class { 'stdlib': }
class { 'apt': }

# Install pip3
package { 'python3-pip':
  ensure => installed,
}

# Install Flask using pip3 with the specified version
exec { 'install_flask':
  command => '/usr/bin/pip3 install flask==2.1.0',
  path    => ['/usr/bin'],
  unless  => '/usr/bin/pip3 show flask | grep -q "^Version: 2.1.0$"',
  require => [
    Package['python3-pip'],
    Class['apt'],
  ],
}

# You might also want to notify services or restart your application
# service { 'your_flask_service':
#   ensure    => running,
#   subscribe => Exec['install_flask'],
# }

