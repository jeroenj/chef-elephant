homebrew_tap 'homebrew/dupes'
homebrew_tap 'caskroom/cask'
homebrew_tap 'caskroom/versions'

package 'brew-cask'

packages = node[:elephant][:homebrew][:packages]

packages.each do |pkg|
  package pkg
end

elephant_recursive_directory '/usr/local/var/log' do
  owner node[:elephant][:username]
  group 'admin'
end
