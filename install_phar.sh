#!/bin/sh

if [ `php -r "echo (version_compare(PHP_VERSION, '5.3.0', '<') ? 1:0);"` = 1 ]
then
  wget http://pecl.php.net/get/phar-2.0.0.tgz
  tar -xzf phar-2.0.0.tgz
  sh -c "cd phar-2.0.0 && phpize && ./configure && make && sudo make install"
  echo "extension=phar.so" >> `php --ini | grep "Loaded Configuration" | sed -e "s|.*:\s*||"`
fi
