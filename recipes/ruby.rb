package 'chruby'
package 'ruby-install'

node[:elephant][:ruby][:rubies].each do |ruby|
  path = ::File.join node[:elephant][:ruby][:path], "ruby-#{ruby}"

  cmd = "ruby-install --install-dir #{path} ruby #{ruby}"
  cmd += " -- --without-tk" if ruby =~ /.*1\.8\.7.*/

  execute cmd do
    not_if{::File.exists? path}
  end
end

pow_installed = ::File.exists? '/usr/local/bin/pow'
package 'pow'
unless pow_installed
  execute 'sudo pow --install-system'
  execute 'pow --install-local'
  execute 'sudo launchctl load -w /Library/LaunchDaemons/cx.pow.firewall.plist'
  execute 'launchctl load -w ~/Library/LaunchAgents/cx.pow.powd.plist'
end

if node[:recipes].include?('elephant::oh_my_zsh')
  template "#{ENV['HOME']}/.oh-my-zsh/custom/chruby.zsh" do
    source 'ruby/chruby.zsh.erb'
  end

  if node[:recipes].include?('elephant::pow')
    cookbook_file "#{ENV['HOME']}/.powconfig" do
      source 'ruby/powconfig'
    end
  end
end

%w[gemrc irbrc].each do |file|
  cookbook_file "#{ENV['HOME']}/.#{file}" do
    source "ruby/#{file}"
  end
end
