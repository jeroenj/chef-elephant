homebrew_tap 'homebrew/dupes'

packages = node[:elephant][:homebrew][:packages]

packages.each do |pkg|
  package pkg
end
