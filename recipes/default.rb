#
# Cookbook:: middleman_install
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

apt_update
apt_package 'ruby'
apt_package 'apache2'

execute 'proxy_http' do
  command 'a2enmod proxy_http'
end

execute 'rewrite' do
  command 'a2enmod rewrite'
end

template '/etc/apache2/sites-enabled/blog.conf' do
  source 'blog.erb'
end



#Install Ruby
#apt_package 'build-essential'
#apt_package 'libssl-dev'
#apt_package 'libyaml-dev'
#apt_package 'libreadline-dev'
#apt_package 'openssl'
#apt_package 'curl'
#apt_package 'git-core'
#apt_package 'zlib1g-dev'
#apt_package 'bison'
#apt_package 'libxml2-dev'
#apt_package 'libxslt1-dev'
#apt_package 'libcurl4-openssl-dev'
#apt_package 'nodejs'
#apt_package 'libsqlite3-dev'
#apt_package 'sqlite3'

