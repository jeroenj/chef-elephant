homebrew_tap 'homebrew/dupes'

packages = node[:elephant][:homebrew][:packages]

packages.each do |pkg|
  package pkg
end

if packages.include?('mariadb')
  link "#{ENV['HOME']}/Library/LaunchAgents/homebrew.mxcl.mariadb.plist" do
    to '/usr/local/opt/mariadb/homebrew.mxcl.mariadb.plist'
  end
end
