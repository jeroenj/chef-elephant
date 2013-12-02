package 'nginx'

sites_enabled = '/usr/local/etc/nginx/sites-enabled'
sites_available = '/usr/local/etc/nginx/sites-available'

[sites_enabled, sites_available].each do |path|
  directory path do
    recursive true
    owner node[:elephant][:username]
    group node[:elephant][:group]
  end
end

execute 'Reload nginx' do
  command '/usr/local/bin/nginx -s reload'
  user node[:elephant][:username]
  action :nothing
end

node[:elephant][:nginx][:vhosts].each do |vhost|
  template ::File.join(sites_available, vhost[:name]) do
    source 'nginx/vhost.erb'
    variables(
      :port => vhost[:port],
      :server_name => vhost[:server_name],
      :ssl_certificate => vhost[:ssl_certificate],
      :ssl_certificate_key => vhost[:ssl_certificate_key],
      :destination => vhost[:destination]
    )
    owner node[:elephant][:username]
    group node[:elephant][:group]
    notifies(:run, 'execute[Reload nginx]')
  end

  link ::File.join(sites_enabled, vhost[:name]) do
    to ::File.join(sites_available, vhost[:name])
    owner node[:elephant][:username]
    group node[:elephant][:group]
  end
end

elephant_plist "#{ENV['HOME']}/Library/LaunchAgents/nginx.plist" do
  content node[:elephant][:nginx][:launch_agent]
  owner node[:elephant][:username]
  group node[:elephant][:group]
end
