if node[:elephant][:vpn][:l2tp_enabled]
  execute 'Set L2TP VPN secret in keychain' do
    command "sudo security add-generic-password -a com.apple.ppp.l2tp -s com.apple.net.racoon -T /usr/sbin/racoon -p #{node[:elephant][:vpn][:l2tp_secret]} /Library/Keychains/System.keychain"
    not_if { system 'security find-generic-password -a com.apple.ppp.l2tp' }
  end
end

plist = '/Library/Preferences/SystemConfiguration/com.apple.RemoteAccessServers.plist'

elephant_permissions plist

template plist do
  source 'vpn/com.apple.RemoteAccessServers.plist.erb'
  variables(
    :pptp_enabled => node[:elephant][:vpn][:pptp_enabled],
    :l2tp_enabled => node[:elephant][:vpn][:l2tp_enabled],
    :dns_servers => node[:elephant][:vpn][:dns_servers],
    :ip_range => node[:elephant][:vpn][:ip_range],
    :log_file => node[:elephant][:vpn][:log_file]
  )
end

chap_secrets = '/etc/ppp/chap-secrets'

elephant_permissions chap_secrets

execute "sudo chown $(whoami):staff #{chap_secrets}" do
  only_if { ::File.exists? chap_secrets }
end

template chap_secrets do
  source 'vpn/chap-secrets.erb'
  variables(
    :chap_secrets => node[:elephant][:vpn][:chap_secrets]
  )
  mode 0600
end

execute "sudo chown root:wheel #{chap_secrets}"

node[:elephant][:vpn][:launch_agents].each do |type, content|
  if node[:elephant][:vpn][:"#{type}_enabled"]
    launch_agent = "/Library/LaunchAgents/#{content[:Label]}.plist"

    elephant_permissions launch_agent

    execute "sudo chown $(whoami):staff #{launch_agent}" do
      only_if { ::File.exists? launch_agent }
    end

    elephant_plist launch_agent do
      content content
      restart false
    end

    execute "sudo chown root:wheel #{launch_agent}"
  end
end
