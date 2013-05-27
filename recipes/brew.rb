homebrew_tap 'homebrew/dupes'

node[:elephant][:homebrew][:packages].each do |pkg|
  package pkg
end
