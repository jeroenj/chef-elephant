dmg_package 'Transmission' do
  source node[:elephant][:transmission][:url]
  checksum node[:elephant][:transmission][:checksum]
end

if node[:elephant][:transmission][:launch_agent]
  elephant_plist "#{ENV['HOME']}/Library/LaunchAgents/transmission.plist" do
    content node[:elephant][:transmission][:launch_agent]
    owner node[:elephant][:username]
    group node[:elephant][:group]
  end
end
