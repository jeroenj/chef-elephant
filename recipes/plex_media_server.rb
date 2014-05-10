homebrew_cask 'plex-media-server'

elephant_plist "#{ENV['HOME']}/Library/LaunchAgents/plex-media-server.plist" do
  content node[:elephant][:plex_media_server][:launch_agent]
  owner node[:elephant][:username]
  group node[:elephant][:group]
end
