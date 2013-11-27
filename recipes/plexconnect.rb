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

file ::File.join(app_path, 'assets/certificates/trailers.pem') do
  content node[:elephant][:plexconnect][:certificate]
  owner node[:elephant][:username]
  group node[:elephant][:group]
end

template ::File.join(app_path, 'Settings.cfg') do
  source 'plexconnect/Settings.cfg.erb'
  variables(
    :certfile => node[:elephant][:plexconnect][:settings][:certfile],
    :ip_pms => node[:elephant][:plexconnect][:settings][:ip_pms],
    :logpath => node[:elephant][:plexconnect][:settings][:logpath]
  )
  owner node[:elephant][:username]
  group node[:elephant][:group]
end

elephant_plist '/Library/LaunchAgents/plexconnect.plist' do
  content node[:elephant][:plexconnect][:launch_agent]
end
