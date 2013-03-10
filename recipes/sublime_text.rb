dmg_package 'Sublime Text 2' do
  dmg_name "Sublime Text #{node['elephant']['sublime_text']['version']}"
  source "http://c758482.r82.cf2.rackcdn.com/Sublime%20Text%20#{node['elephant']['sublime_text']['version']}.dmg"
  checksum node['elephant']['sublime_text']['checksum']
  owner node['elephant']['user']
end

link '/usr/bin/subl' do
  to '/Applications/Sublime Text 2.app/Contents/SharedSupport/bin/subl'
end

['Preferences.sublime-settings', 'Default (OSX).sublime-keymap'].each do |file|
  cookbook_file "#{ENV['HOME']}/Library/Application Support/Sublime Text 2/Packages/User/#{file}" do
    source "sublime_text/#{file}"
    owner node['elephant']['user']
  end
end

remote_file "#{ENV['HOME']}/Library/Application Support/Sublime Text 2/Installed Packages/Package Control.sublime-package" do
  source 'http://sublime.wbond.net/Package%20Control.sublime-package'
  owner node['elephant']['user']
  :create_if_missing
end

node['elephant']['sublime_text']['packages'].each do |package|
  git ::File.expand_path(package['name'], "#{ENV['HOME']}/Library/Application Support/Sublime Text 2/Packages") do
    repository package['source']
    user node['elephant']['user']
    action :sync
  end
end
