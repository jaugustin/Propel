#!/bin/sh
less_than_php_5.3=$(php -r "echo version_compare(PHP_VERSION, '5.3.0', '<') ? 'TRUE' : 'FALSE';")
if [ ${less_than_php_5_3} = 'TRUE' ]
then
  wget http://pecl.php.net/get/phar-2.0.0.tgz
  tar -xzf phar-2.0.0.tgz
  sh -c "cd phar-2.0.0 && phpize && ./configure && make && sudo make install"
  echo "extension=phar.so" >> `php --ini | grep "Loaded Configuration" | sed -e "s|.*:\s*||"`
fi
