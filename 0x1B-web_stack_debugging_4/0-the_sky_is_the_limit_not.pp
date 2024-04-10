# change the soft limit to the hard limit to accept the maximum number of requests
exec { 'fixes':
  command => '/bin/sed -i "s/15/4096/" /etc/default/nginx',
  path    => '/usr/local/bin/:/bin/',
}

# restart nginx
exec { 'restart-nginx':
  command => '/etc/init.d/nginx restart',
  path    => '/etc/init.d/',
}
