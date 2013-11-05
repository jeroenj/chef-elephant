package 'chruby'
package 'ruby-install'

node[:elephant][:ruby][:rubies].each do |ruby|
  name = "ruby-#{ruby}"
  path = ::File.join node[:elephant][:ruby][:path], name

  cmd = "ruby-install --install-dir #{path} --src-dir /tmp ruby #{ruby}"
  cmd += " -- --without-tk" if ruby =~ /.*1\.8\.7.*/

  execute "Install ruby #{ruby}" do
    command cmd
    not_if { ::File.exists? path }
  end

  node[:elephant][:ruby][:gems].each do |ruby_gem|
    pre = "source /usr/local/opt/chruby/share/chruby/chruby.sh && RUBIES=(/usr/local/var/rubies/*) && chruby #{ruby}"
    gem_binary = ::File.join node[:elephant][:ruby][:path], name, '/bin/gem'
    gem_exec = "#{pre} && #{gem_binary}"
    version = "--version #{ruby_gem[:version]}" if ruby_gem[:version]
    description_version = " #{ruby_gem[:version]}" if ruby_gem[:version]

    execute "Install #{ruby_gem[:name]}#{description_version} on ruby #{ruby}" do
      command "#{gem_exec} install #{ruby_gem[:name]} #{version}"
      not_if { `#{gem_exec} list #{ruby_gem[:name]}` =~ /#{ruby_gem[:name]}.*#{ruby_gem[:version]}/ }
    end
  end
end

file "#{ENV['HOME']}/.ruby-version" do
  content node[:elephant][:ruby][:default]
end

if node[:recipes].include?('elephant::oh_my_zsh')
  template "#{ENV['HOME']}/.oh-my-zsh/custom/chruby.zsh" do
    source 'ruby/chruby.zsh.erb'
    only_if { Dir.exists? "#{ENV['HOME']}/.oh-my-zsh/custom" }
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
