%w[json rest-client].each do |name|
  elephant_gem name
end

app_path = ::File.join node[:elephant][:apps_path], 'do-dyndns'

directory app_path do
  recursive true
  owner node[:elephant][:username]
  group node[:elephant][:group]
end

git app_path do
  repository 'git@github.com:jeroenj/do-dyndns.git'
  reference 'master'
  action :checkout
  user node[:elephant][:username]
  group node[:elephant][:group]
end

file_path = ::File.join app_path, 'dns.rb'
%w[CLIENT_ID API_KEY].each do |secret|
  execute "Set do-dyndns #{secret}" do
    command "sed -ibak \"s/#{secret} = ''/#{secret} = '#{node[:elephant][:do_dyndns][secret.downcase]}'/g\" #{file_path}"
    only_if { system("grep \"#{secret} = ''\" #{file_path}") }
  end
end

elephant_plist "/Library/LaunchAgents/#{node[:elephant][:do_dyndns][:launch_agent][:Label]}.plist" do
  content node[:elephant][:do_dyndns][:launch_agent]
end
