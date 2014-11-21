#
# Cookbook Name:: fluentd
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

package "ruby-dev" do
  action :install
end

package "libssl-dev" do
  action :install
end

gem_package "fluentd-ui" do
  action :install
end

template "fluentd-ui" do
  path "/etc/init.d/fluentd-ui"
  owner "root"
  group "root"
  mode 0755
end

service "fluentd-ui" do
  action [:enable, :start]
end

service "iptables" do
  action [:disable, :stop]
end
