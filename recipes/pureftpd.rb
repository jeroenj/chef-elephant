package 'pure-ftpd'

cookbook_file '/Library/LaunchAgents/homebrew.mxcl.pure-ftpd.plist' do
  source 'pureftpd/homebrew.mxcl.pure-ftpd.plist'
  mode 0644
end

template '/usr/local/etc/pureftpd.passwd' do
  source 'pureftpd/pureftpd.passwd.erb'
  variables :accounts => node[:elephant][:pureftpd][:accounts]
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
