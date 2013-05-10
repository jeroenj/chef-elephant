dmg_package 'Sublime Text 2' do
  dmg_name "Sublime Text #{node['elephant']['sublime_text']['version']}"
  source "http://c758482.r82.cf2.rackcdn.com/Sublime%20Text%20#{node['elephant']['sublime_text']['version']}.dmg"
  checksum node['elephant']['sublime_text']['checksum']
  owner node['elephant']['user']
end

settings_path = "#{ENV['HOME']}/Library/Application Support/Sublime Text 2"

link '/usr/bin/subl' do
  to '/Applications/Sublime Text 2.app/Contents/SharedSupport/bin/subl'
end

['Preferences.sublime-settings', 'Default (OSX).sublime-keymap'].each do |file|
  cookbook_file ::File.expand_path("Packages/User/#{file}", settings_path) do
    source "sublime_text/#{file}"
    owner node['elephant']['user']
  end
end

cookbook_file ::File.expand_path('Settings/Session.sublime_session', settings_path) do
  source "sublime_text/Session.sublime_session"
  owner node['elephant']['user']
end

remote_file ::File.expand_path("Installed Packages/Package Control.sublime-package", settings_path) do
  source 'http://sublime.wbond.net/Package%20Control.sublime-package'
  owner node['elephant']['user']
  :create_if_missing
end

if license = node['elephant']['sublime_text']['license']
  file ::File.expand_path('Settings/License.sublime_license', settings_path) do
    content license
    owner node['elephant']['user']
  end
end

node['elephant']['sublime_text']['packages'].each do |package|
  git ::File.expand_path("Packages/#{package['name']}", settings_path) do
    repository package['source']
    user node['elephant']['user']
    action :sync
  end
end
