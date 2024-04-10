# Puppet manifest to fix typo in WordPress file wp-settings.php

# Fix the typo in wp-settings.php
exec { 'fix-wordpress-typo':
  command     => 'sed -i "s/phpp/php/g" /var/www/html/wp-settings.php',
  path        => ['/usr/bin', '/bin'],  # Specify the path to sed
  unless      => 'grep -q "php" /var/www/html/wp-settings.php',  # Check if the file has already been fixed
  onlyif      => 'test -f /var/www/html/wp-settings.php',  # Ensure the file exists
}

# Ensure the wp-settings.php file exists
file { '/var/www/html/wp-settings.php':
  ensure  => file,
  require => Exec['fix-wordpress-typo'],  # Make sure the fix occurs before ensuring file existence
}
