# -*- coding: utf-8 -*-
#
# Cookbook:: foreman
# Recipe:: proxy
#
include_recipe 'foreman::proxy_install'
include_recipe 'foreman::proxy_config'
include_recipe 'foreman::proxy_service'
include_recipe 'foreman::proxy_register'
