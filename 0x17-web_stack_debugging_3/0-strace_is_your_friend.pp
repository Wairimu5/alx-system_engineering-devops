# Puppet manifest to fix typo in WordPress file wp-settings.php using strace

exec { 'fix-wordpress':
  command     => 'strace -o /tmp/strace_output sed -i s/phpp/php/g /var/www/html/wp-settings.php',
  path        => '/usr/local/bin/:/bin/',
  refreshonly => true,
}

file { '/var/www/html/wp-settings.php':
  ensure  => file,
  require => Exec['fix-wordpress'],
}
