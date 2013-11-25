default[:homebrew][:owner] = node[:elephant][:username]
default[:elephant][:group] = 'staff'
default[:elephant][:homebrew][:packages] = []
default[:elephant][:apps_path] = "#{ENV['HOME']}/apps"
