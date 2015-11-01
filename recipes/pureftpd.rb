package 'pure-ftpd'

elephant_recursive_directory node[:elephant][:pureftpd][:log_file] do
  owner node[:elephant][:username]
  group node[:elephant][:group]
end

elephant_plist '/Library/LaunchDaemons/pureftpd.plist' do
  content node[:elephant][:pureftpd][:launch_daemon]
end

template '/usr/local/etc/pureftpd.passwd' do
  source 'pureftpd/pureftpd.passwd.erb'
  variables accounts: node[:elephant][:pureftpd][:accounts]
  owner node[:elephant][:username]
  group node[:elephant][:group]
  notifies :run, 'execute[Update pureftpd database]'
end

execute 'Update pureftpd database' do
  command 'pure-pw mkdb'
  user node[:elephant][:username]
  group node[:elephant][:group]
  action :nothing
end
