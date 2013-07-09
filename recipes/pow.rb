pow_installed = ::File.exists? '/usr/local/bin/pow'

package 'pow'

unless pow_installed
  # Homebrew does not take care of this (yet)
  # https://github.com/37signals/pow/issues/298
  pow_hosts = "#{ENV['HOME']}/Library/Application Support/Pow/Hosts"
  directory pow_hosts do
    recursive true
  end
  link "#{ENV['HOME']}/.pow" do
    to pow_hosts
  end

  execute 'sudo pow --install-system'
  execute 'pow --install-local'
  execute 'sudo launchctl load -w /Library/LaunchDaemons/cx.pow.firewall.plist'
  execute 'launchctl load -w ~/Library/LaunchAgents/cx.pow.powd.plist'
end
