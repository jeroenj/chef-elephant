dmg_package 'ownCloud' do
  source node[:elephant][:owncloud][:url]
  checksum node[:elephant][:owncloud][:checksum]
end

settings_path = "#{ENV['HOME']}/Library/Application Support/ownCloud"

directory settings_path

template ::File.expand_path('owncloud.cfg', settings_path) do
  source 'owncloud/owncloud.cfg.erb'
  variables({
    :certificate => node[:elephant][:owncloud][:certificate],
    :url => node[:elephant][:owncloud][:server_url],
    :user => node[:elephant][:owncloud][:user]
  })
end
