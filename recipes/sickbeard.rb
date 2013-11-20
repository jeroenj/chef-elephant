elephant_pip 'pyOpenSSL'
elephant_pip 'cheetah'

app_path = ::File.join node[:elephant][:apps_path], 'sickbeard'

directory app_path do
  recursive true
end

git app_path do
  repository 'git@github.com:midgetspy/Sick-Beard.git'
  reference 'master'
  action :checkout
end

file_path = File.join app_path, 'lib/tvdb_api/tvdb_api.py'
patch_path = File.expand_path File.join(__FILE__, '../../files/default/sickbeard/tvdb_api.patch')

execute 'Apply Sick Beard tvdb api patch' do
  command "patch \"#{file_path}\" \"#{patch_path}\""
  only_if { system "patch --silent --forward --dry-run \"#{file_path}\" \"#{patch_path}\" > /dev/null" }
end

template ::File.join(node[:elephant][:apps_path], 'sickbeard/config.ini') do
  source 'sickbeard/config.ini.erb'
  variables(
    :web_port => node[:elephant][:sickbeard][:settings][:web_port],
    :username => node[:elephant][:sickbeard][:settings][:username],
    :password => node[:elephant][:sickbeard][:settings][:password],
    :api_key => node[:elephant][:sickbeard][:settings][:api_key],
    :https_cert => node[:elephant][:sickbeard][:settings][:https_cert],
    :https_key => node[:elephant][:sickbeard][:settings][:https_key],
    :directory => node[:elephant][:sickbeard][:settings][:directory],
    :nzbs_uid => node[:elephant][:sickbeard][:settings][:nzbs_uid],
    :nzbs_hash => node[:elephant][:sickbeard][:settings][:nzbs_hash],
    :nzbsrus_uid => node[:elephant][:sickbeard][:settings][:nzbsrus_uid],
    :nzbsrus_hash => node[:elephant][:sickbeard][:settings][:nzbsrus_hash],
    :sab_username => node[:elephant][:sickbeard][:settings][:sab_username],
    :sab_password => node[:elephant][:sickbeard][:settings][:sab_password],
    :sab_apikey => node[:elephant][:sickbeard][:settings][:sab_apikey],
    :sab_category => node[:elephant][:sickbeard][:settings][:sab_category],
    :sab_host => node[:elephant][:sickbeard][:settings][:sab_host],
    :twitter_username => node[:elephant][:sickbeard][:settings][:twitter_username],
    :twitter_password => node[:elephant][:sickbeard][:settings][:twitter_password],
    :newznab_data => node[:elephant][:sickbeard][:settings][:newznab_data]
  )
end

elephant_plist "#{ENV['HOME']}/Library/LaunchAgents/sickbeard.plist" do
  content node[:elephant][:sickbeard][:launch_agent]
end
