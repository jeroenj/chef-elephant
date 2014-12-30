default[:elephant][:username] = 'jeroen'
default[:elephant][:uid] = `id -u #{node[:elephant][:username]}`
default[:homebrew][:owner] = node[:elephant][:username]
default[:elephant][:group] = 'staff'
default[:elephant][:apps_path] = "#{ENV['HOME']}/apps"
