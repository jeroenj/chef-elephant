package 'chruby'
package 'ruby-install'

directory node[:elephant][:chruby][:path] do
  owner node[:elephant][:username]
  group node[:elephant][:group]
end

node[:elephant][:chruby][:rubies].each do |ruby|
  name = "ruby-#{ruby}"
  path = ::File.join node[:elephant][:chruby][:path], name

  cmd = "ruby-install --install-dir #{path} --src-dir /tmp ruby #{ruby}"

  execute "Install ruby #{ruby}" do
    command cmd
    user node[:elephant][:username]
    group 'admin'
    not_if { ::File.exist? path }
  end

  node[:elephant][:chruby][:gems].each do |ruby_gem|
    gem_exec = "source /usr/local/opt/chruby/share/chruby/chruby.sh && RUBIES=(#{path}) && chruby #{ruby} && #{::File.join path, 'bin/gem'}"
    version = " --version '#{ruby_gem[:version]}'" if ruby_gem[:version]
    description_version = " #{ruby_gem[:version]}" if ruby_gem[:version]

    execute "Install #{ruby_gem[:name]}#{description_version} on ruby #{ruby}" do
      command "#{gem_exec} install #{ruby_gem[:name]}#{version}"
      user node[:elephant][:username]
      group node[:elephant][:group]
      not_if { system({ 'UID' => node[:elephant][:uid], 'GEM_PATH' => '' }, "#{gem_exec} list #{ruby_gem[:name]} --installed#{version} > /dev/null") }
    end
  end
end

file "#{ENV['HOME']}/.ruby-version" do
  content node[:elephant][:chruby][:default]
  owner node[:elephant][:username]
  group node[:elephant][:group]
end

if node[:recipes].include?('elephant::pow')
  template "#{ENV['HOME']}/.powconfig" do
    source 'chruby/powconfig'
    owner node[:elephant][:username]
    group node[:elephant][:group]
  end
end
