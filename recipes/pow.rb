pow_installed = ::File.exists? '/usr/local/bin/pow'

package 'pow'

unless pow_installed
  execute 'sudo pow --install-system'
  execute 'pow --install-local'
  execute 'sudo launchctl load -w /Library/LaunchDaemons/cx.pow.firewall.plist'
  execute 'launchctl load -w ~/Library/LaunchAgents/cx.pow.powd.plist'
end
