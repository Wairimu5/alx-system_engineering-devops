# give the user holberton ability to access multiple files
exec { 'increase-file-limit':
  command => 'sed -i "/^holberton hard/s/5/11000/" /etc/security/limits.conf',
  path    => '/usr/local/bin/:/bin/'
}

exec { 'increase-soft':
  command => 'sed -i "/^holberton soft/s/4/11000/" /etc/security/limits.conf',
  path    => '/usr/local/bin/:/bin/',
}
