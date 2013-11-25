package 'mariadb'

link "#{ENV['HOME']}/Library/LaunchAgents/homebrew.mxcl.mariadb.plist" do
  to '/usr/local/opt/mariadb/homebrew.mxcl.mariadb.plist'
  owner node[:elephant][:username]
  group node[:elephant][:group]
end
