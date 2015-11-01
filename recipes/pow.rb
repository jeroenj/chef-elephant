pow_installed = ::File.exist? '/usr/local/bin/pow'

package 'pow'

unless pow_installed
  # Homebrew does not take care of this (yet)
  # https://github.com/37signals/pow/issues/298
  pow_hosts = "#{ENV['HOME']}/Library/Application Support/Pow/Hosts"
  elephant_recursive_directory pow_hosts do
    owner node[:elephant][:username]
    group node[:elephant][:group]
  end
  link "#{ENV['HOME']}/.pow" do
    to pow_hosts
    owner node[:elephant][:username]
    group node[:elephant][:group]
  end

  execute 'pow --install-system'
  execute 'pow --install-local' do
    user node[:elephant][:username]
    group node[:elephant][:group]
  end
  execute 'launchctl load -w /Library/LaunchDaemons/cx.pow.firewall.plist'
  execute 'launchctl load -w ~/Library/LaunchAgents/cx.pow.powd.plist' do
    user node[:elephant][:username]
    group node[:elephant][:group]
  end
end
