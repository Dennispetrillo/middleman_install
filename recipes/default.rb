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

file '/etc/apache2/sites-enabled/000-default.conf' do
  action :delete
end

service 'apache2' do
  action :restart
end

apt_package 'git'

git "git_repo" do
  repository 'https://github.com/learnchef/middleman-blog.git'
  action :sync
  destination '/middleman_blog'
end

gem_package 'bundler'

user 'bundle_user' do
  shell '/bin/bash'
  home '/home/bundle_user'
end

execute 'bundle_install' do
  command 'bundle install'
  user 'bundle_user'
  cwd '/var/lib/gems/2.3.0/cache'
end
