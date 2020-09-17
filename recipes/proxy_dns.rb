# -*- coding: utf-8 -*-
#
# Cookbook:: foreman
# Recipe:: proxy_dns
#
node.override['bind']['zones']['attribute'] = [node['foreman']['server_name']]

hostsfile_entry '127.0.0.1' do
  hostname node['foreman']['server_name']
  action :append
end

include_recipe 'bind'
