# @summary LIM RHEL8 SELinux RHEL8 Security
#
# Setting SELinux to Permissive mode permanently 
#
#
class security::selinux{

file { '/etc/selinux/config':
  ensure => present,
}->

file_line{'Setting SELinux to Permissive mode permanently':
  ensure => present,
  path   => '/etc/selinux/config',
  line   => 'SELINUX=permissive',
  match  => "^SELINUX=.*$",
  notify => Exec['noreboot'],
}

exec{'noreboot':
  refreshonly => true,
  command     => 'setenforce 0',
}
}
