path = '/usr/local/etc/newsyslog.d'
config_path = ::File.join path, 'custom.conf'
source_path = '/etc/newsyslog.d/custom.conf'

directory path

template config_path do
  source 'logrotate/custom.conf.erb'
  variables :files => node[:elephant][:logrotate][:files]
  mode 0644
end

execute "sudo ln -s #{config_path} #{source_path}" do
  not_if { ::File.exists?(source_path) && ::File.realpath(source_path) == config_path }
end
