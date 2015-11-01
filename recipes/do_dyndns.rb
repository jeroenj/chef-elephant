gem_package 'httparty'

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
execute 'Set do-dyndns TOKEN' do
  command "sed -ibak \"s/TOKEN = ''/TOKEN = '#{node[:elephant][:do_dyndns][:token]}'/g\" #{file_path}"
  only_if { system("grep \"TOKEN = ''\" #{file_path}") }
end

elephant_plist "/Library/LaunchDaemons/#{node[:elephant][:do_dyndns][:launch_daemon][:Label]}.plist" do
  content node[:elephant][:do_dyndns][:launch_daemon]
end
