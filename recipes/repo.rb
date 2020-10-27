#
# Cookbook:: foreman
# Recipe:: repo
#
apt_repository 'foreman' do
  uri node['foreman']['repo']['uri']
  components node['foreman']['repo']['components']
  key node['foreman']['repo']['key']
end

apt_repository 'foreman_plugins' do
  uri node['foreman']['repo']['uri']
  distribution 'plugins'
  components node['foreman']['repo']['components']
  key node['foreman']['repo']['key']
end

apt_update 'apt'
