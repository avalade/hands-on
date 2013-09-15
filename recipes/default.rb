#
# Cookbook Name:: hands-on
# Recipe:: default
#
# Copyright (C) 2013 Aaron Valade
#
# All rights reserved - Do Not Redistribute
#

user node['hands-on']['user'] do
  comment 'A SSH tunnel user'
  supports :manage_home => true
  home node['hands-on']['home']
  shell '/bin/bash'
end

package node['hands-on']['package']

ssh_config_content = """
ExitOnForwardFailure yes
CheckHostIP no
StrictHostKeyChecking no
UserKnownHostsFile /dev/null
BatchMode yes
GatewayPorts yes
RemoteForward 0 127.0.0.1:22
"""
node['hands-on']['forwards'].each do |forward|
  ssh_config_content <<
    "LocalForward #{forward[:local]} 127.0.0.1:#{forward[:remote]}\n"
end

file "#{node['hands-on']['home']}/ssh_config" do
  owner node['hands-on']['user']
  group node['hands-on']['user']
  mode "0700"
  content ssh_config_content
end

file "#{node['hands-on']['home']}/id_rsa" do
  owner node['hands-on']['user']
  group node['hands-on']['user']
  mode "0700"
  content node['hands-on']['key']
end

template '/etc/init/hands-on.conf' do
  source 'hands-on.upstart.erb'
  mode 0644
  notifies :restart, 'service[hands-on]', :delayed
end

service 'hands-on' do
  provider Chef::Provider::Service::Upstart
  action [:enable, :start]
end
