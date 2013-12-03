file = "#{Chef::Config[:file_cache_path]}/plex_media_server_#{node[:elephant][:plex_media_server][:version]}.zip"

remote_file file do
  source node[:elephant][:plex_media_server][:url]
  checksum node[:elephant][:plex_media_server][:checksum]
  not_if { ::File.directory?('/Applications/Plex Media Server.app') }
end

execute 'Install Plex Media Server' do
  command "unzip #{file}"
  cwd '/Applications'
  not_if { ::File.directory?('/Applications/Plex Media Server.app') }
end

elephant_plist "#{ENV['HOME']}/Library/LaunchAgents/plex-media-server.plist" do
  content node[:elephant][:plex_media_server][:launch_agent]
  owner node[:elephant][:username]
  group node[:elephant][:group]
end
