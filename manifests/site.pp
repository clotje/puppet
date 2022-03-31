# @summary LIM RHEL8 SELinux RHEL8 Security
#
# Setting SELinux to Permissive mode permanently 
# Using the setenforce 0 because selinux need a reboot
#
class security::site {
file { '/etc/selinux/config':
  ensure => present,
}~>

file_line{'Setting SELinux to Permissive mode permanently':
  path   => '/etc/selinux/config',
  line   => 'SELINUX=permissive',
  match  => "^SELINUX=.*$",
  notify => Exec["noreboot"],
}

exec{"noreboot":
  path        => "/sbin:/usr/sbin:/bin:/usr/bin",
  command     => 'setenforce 0',
  refreshonly => true,
}
}
