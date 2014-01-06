action :install do
  gem_exec = "source /usr/local/opt/chruby/share/chruby/chruby.sh && RUBIES=(/usr/local/var/rubies/#{new_resource.ruby_version}) && chruby #{new_resource.ruby_version} && gem"
  version = "--version #{new_resource.version}" if new_resource.version
  description_version = " #{new_resource.version}" if new_resource.version

  execute "Install #{new_resource.name}#{description_version} on ruby #{new_resource.ruby_version}" do
    command "#{gem_exec} install #{new_resource.name} #{version}"
    user node[:elephant][:username]
    group node[:elephant][:group]
    not_if { system({'UID' => node[:elephant][:uid]}, "#{gem_exec} list #{new_resource.name} --installed #{version} > /dev/null") }
  end
end
