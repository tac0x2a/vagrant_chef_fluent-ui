#
# Cookbook Name:: fluentd
# Recipe:: default
#
# Copyright 2014, TAC
#
# All rights reserved - Do Not Redistribute
#

packages = ["build-essential", "ruby-dev", "libssl-dev"]
packages.each do |p|
  package p do
    action :install
  end
end

gem_packages = ["fluentd-ui"]
gem_packages.each do |p|
  gem_package p do
    action :install
    end
end

template "fluentd-ui" do
  path "/etc/init.d/fluentd-ui"
  owner "root"
  group "root"
  mode 0755
end

service "fluentd-ui" do
  supports :start => true, :stop => true
  action [:start, :enable]
end
