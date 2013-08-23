package 'chruby'
package 'ruby-install'

node[:elephant][:ruby][:rubies].each do |ruby|
  name = "ruby-#{ruby}"
  path = ::File.join node[:elephant][:ruby][:path], name

  cmd = "ruby-install --install-dir #{path} --src-dir /tmp ruby #{ruby}"
  cmd += " -- --without-tk" if ruby =~ /.*1\.8\.7.*/

  execute "Install ruby #{ruby}" do
    command cmd
    not_if{::File.exists? path}
  end

  node[:elephant][:ruby][:gems].each do |gem_name|
    gem_package "#{gem_name} (#{name})}" do
      package_name gem_name
      gem_binary ::File.join(node[:elephant][:ruby][:path], name, '/bin/gem')
    end
  end
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
