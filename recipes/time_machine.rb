elephant_plist '/Library/LaunchDaemons/timemachine.plist' do
  content node[:elephant][:time_machine][:launch_daemon]
end

execute 'Disable scheduled Time Machine backups' do
  command 'tmutil disable'
  only_if { `defaults read /Library/Preferences/com.apple.TimeMachine.plist AutoBackup`.to_i == 1 }
end
