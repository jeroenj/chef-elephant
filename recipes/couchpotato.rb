include_recipe 'elephant::python'

app_path = ::File.join node[:elephant][:apps_path], 'couchpotato'

directory app_path do
  recursive true
  owner node[:elephant][:username]
  group node[:elephant][:group]
end

git app_path do
  repository 'git@github.com:RuudBurger/CouchPotatoServer.git'
  reference 'master'
  action :checkout
  user node[:elephant][:username]
  group node[:elephant][:group]
end

settings_path = "#{ENV['HOME']}/Library/Application Support/CouchPotato"

directory settings_path do
  recursive true
  owner node[:elephant][:username]
  group node[:elephant][:group]
end

template ::File.join(settings_path, 'settings.conf') do
  source 'couchpotato/settings.conf.erb'
  owner node[:elephant][:username]
  group node[:elephant][:group]
  variables(
    :api_key => node[:elephant][:couchpotato][:settings][:api_key],
    :directory => node[:elephant][:couchpotato][:settings][:directory],
    :ignored_words => node[:elephant][:couchpotato][:settings][:ignored_words],
    :imdb_watchlist => node[:elephant][:couchpotato][:settings][:imdb_watchlist],
    :library => node[:elephant][:couchpotato][:settings][:library],
    :nzbs_api_key => node[:elephant][:couchpotato][:settings][:nzbs_api_key],
    :password => node[:elephant][:couchpotato][:settings][:password],
    :port => node[:elephant][:couchpotato][:settings][:port],
    :preferred_words => node[:elephant][:couchpotato][:settings][:preferred_words],
    :sabnzbd_api_key => node[:elephant][:couchpotato][:settings][:sabnzbd_api_key],
    :sabnzbd_url => node[:elephant][:couchpotato][:settings][:sabnzbd_url],
    :ssl_cert => node[:elephant][:couchpotato][:settings][:ssl_cert],
    :ssl_key => node[:elephant][:couchpotato][:settings][:ssl_key],
    :themoviedb_api_key => node[:elephant][:couchpotato][:settings][:themoviedb_api_key],
    :transmission_url => node[:elephant][:couchpotato][:settings][:transmission_url],
    :twitter_access_token_key => node[:elephant][:couchpotato][:settings][:twitter_access_token_key],
    :twitter_access_token_secret => node[:elephant][:couchpotato][:settings][:twitter_access_token_secret],
    :twitter_username => node[:elephant][:couchpotato][:settings][:twitter_username],
    :username => node[:elephant][:couchpotato][:settings][:username]
  )
end

elephant_plist "#{ENV['HOME']}/Library/LaunchAgents/couchpotato.plist" do
  content node[:elephant][:couchpotato][:launch_agent]
  owner node[:elephant][:username]
  group node[:elephant][:group]
end
