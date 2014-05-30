homebrew_cask 'transmission'

execute 'Set remote access password' do
  command "security unlock #{ENV['HOME']}/Library/Keychains/login.keychain && security add-generic-password -a Remote -s Transmission:Remote -T /Applications/Transmission.app -w #{node[:elephant][:transmission][:remote_access_password]} #{ENV['HOME']}/Library/Keychains/login.keychain"
  not_if { system 'security find-generic-password -s Transmission:Remote > /dev/null' }
end

if node[:elephant][:transmission][:launch_agent]
  elephant_plist "#{ENV['HOME']}/Library/LaunchAgents/transmission.plist" do
    content node[:elephant][:transmission][:launch_agent]
    owner node[:elephant][:username]
    group node[:elephant][:group]
  end
end
