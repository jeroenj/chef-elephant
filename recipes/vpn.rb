if node[:elephant][:vpn][:l2tp_enabled]
  execute 'Set L2TP VPN secret in keychain' do
    command "security add-generic-password -a com.apple.ppp.l2tp -s com.apple.net.racoon -T /usr/sbin/racoon -w #{node[:elephant][:vpn][:l2tp_secret]} /Library/Keychains/System.keychain"
    not_if { system 'security find-generic-password -a com.apple.ppp.l2tp > /dev/null' }
  end
end

template '/Library/Preferences/SystemConfiguration/com.apple.RemoteAccessServers.plist' do
  source 'vpn/com.apple.RemoteAccessServers.plist.erb'
  variables(
    pptp_enabled: node[:elephant][:vpn][:pptp_enabled],
    l2tp_enabled: node[:elephant][:vpn][:l2tp_enabled],
    dns_servers: node[:elephant][:vpn][:dns_servers],
    ip_range: node[:elephant][:vpn][:ip_range],
    log_file: node[:elephant][:vpn][:log_file]
  )
end

template '/etc/ppp/chap-secrets' do
  source 'vpn/chap-secrets.erb'
  variables(
    chap_secrets: node[:elephant][:vpn][:chap_secrets]
  )
  mode 0600
end

node[:elephant][:vpn][:launch_daemons].each do |type, content|
  if node[:elephant][:vpn][:"#{type}_enabled"]
    launch_daemon = "/Library/LaunchDaemons/#{content[:Label]}.plist"

    elephant_plist launch_daemon do
      content content
    end
  end
end
