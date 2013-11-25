homebrew_tap 'homebrew/dupes'

packages = node[:elephant][:homebrew][:packages]

packages.each do |pkg|
  package pkg
end

directory '/usr/local/var/log' do
  recursive true
  owner node[:elephant][:username]
  group node[:elephant][:group]
end
