package 'chruby'
package 'ruby-install'

node[:elephant][:ruby][:rubies].each do |ruby|
  name = "ruby-#{ruby}"
  path = ::File.join node[:elephant][:ruby][:path], name

  cmd = "ruby-install --install-dir #{path} --src-dir /tmp ruby #{ruby}"
  cmd += " -- --without-tk" if ruby =~ /.*1\.8\.7.*/

  execute "Install ruby #{ruby}" do
    command cmd
    user node[:elephant][:username]
    group node[:elephant][:group]
    not_if { ::File.exists? path }
  end

  node[:elephant][:ruby][:gems].each do |ruby_gem|
    description_version = " #{ruby_gem[:version]}" if ruby_gem[:version]
    description = "#{ruby_gem[:name]}#{description_version} on ruby #{ruby}"

    elephant_gem description do
      name ruby_gem[:name]
      version ruby_gem[:version]
      ruby_version ruby
    end
  end
end

file "#{ENV['HOME']}/.ruby-version" do
  content node[:elephant][:ruby][:default]
  owner node[:elephant][:username]
  group node[:elephant][:group]
end

if node[:recipes].include?('elephant::oh_my_zsh')
  template "#{ENV['HOME']}/.oh-my-zsh/custom/chruby.zsh" do
    source 'ruby/chruby.zsh.erb'
    owner node[:elephant][:username]
    group node[:elephant][:group]
    only_if { Dir.exists? "#{ENV['HOME']}/.oh-my-zsh/custom" }
  end

  if node[:recipes].include?('elephant::pow')
    cookbook_file "#{ENV['HOME']}/.powconfig" do
      source 'ruby/powconfig'
      owner node[:elephant][:username]
      group node[:elephant][:group]
    end
  end
end

%w[gemrc irbrc].each do |file|
  cookbook_file "#{ENV['HOME']}/.#{file}" do
    source "ruby/#{file}"
    owner node[:elephant][:username]
    group node[:elephant][:group]
  end
end
