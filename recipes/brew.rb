homebrew_tap 'homebrew/dupes'
homebrew_tap 'phinze/cask'

package 'brew-cask'

packages = node[:elephant][:homebrew][:packages]

packages.each do |pkg|
  package pkg
end

elephant_recursive_directory '/usr/local/var/log' do
  owner node[:elephant][:username]
  group node[:elephant][:group]
end
