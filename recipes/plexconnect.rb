include_recipe 'elephant::python'

app_path = ::File.join node[:elephant][:apps_path], 'plexconnect'

directory app_path do
  recursive true
  owner node[:elephant][:username]
  group node[:elephant][:group]
end

git app_path do
  repository 'git@github.com:iBaa/PlexConnect.git'
  action :sync
  revision node[:elephant][:plexconnect][:revision]
  user node[:elephant][:username]
  group node[:elephant][:group]
end

pem_path = ::File.expand_path(::File.join(app_path, node[:elephant][:plexconnect][:settings][:certfile]))
file pem_path do
  content node[:elephant][:plexconnect][:certificate] + node[:elephant][:plexconnect][:key]
  owner node[:elephant][:username]
  group node[:elephant][:group]
end

file pem_path.gsub(/pem\z/, 'cer') do
  content node[:elephant][:plexconnect][:certificate]
  owner node[:elephant][:username]
  group node[:elephant][:group]
end

template ::File.join(app_path, 'Settings.cfg') do
  source 'plexconnect/Settings.cfg.erb'
  variables(
    certfile: node[:elephant][:plexconnect][:settings][:certfile],
    hosttointercept: node[:elephant][:plexconnect][:settings][:hosttointercept],
    ip_pms: node[:elephant][:plexconnect][:settings][:ip_pms],
    logpath: node[:elephant][:plexconnect][:settings][:logpath]
  )
  owner node[:elephant][:username]
  group node[:elephant][:group]
end

template ::File.join(app_path, 'ATVSettings.cfg') do
  source 'plexconnect/ATVSettings.cfg.erb'
  variables(
    myplex_user: node[:elephant][:plexconnect][:settings][:myplex_user],
    myplex_auth: node[:elephant][:plexconnect][:settings][:myplex_auth],
    apple_tv_id: node[:elephant][:plexconnect][:settings][:apple_tv_id]
  )
  owner node[:elephant][:username]
  group node[:elephant][:group]
end

elephant_plist '/Library/LaunchDaemons/plexconnect.plist' do
  content node[:elephant][:plexconnect][:launch_daemon]
end
