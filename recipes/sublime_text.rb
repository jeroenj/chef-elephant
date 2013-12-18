dmg_package 'Sublime Text 2' do
  dmg_name "Sublime Text #{node[:elephant][:sublime_text][:version]}"
  source node[:elephant][:sublime_text][:url]
  checksum node[:elephant][:sublime_text][:checksum]
end

settings_path = "#{ENV['HOME']}/Library/Application Support/Sublime Text 2"

link '/usr/bin/subl' do
  to '/Applications/Sublime Text 2.app/Contents/SharedSupport/bin/subl'
end

elephant_recursive_directory settings_path do
  owner node[:elephant][:username]
  group node[:elephant][:group]
end
elephant_recursive_directory "#{settings_path}/Packages/User" do
  owner node[:elephant][:username]
  group node[:elephant][:group]
end
elephant_recursive_directory "#{settings_path}/Settings" do
  owner node[:elephant][:username]
  group node[:elephant][:group]
end
elephant_recursive_directory "#{settings_path}/Installed Packages" do
  owner node[:elephant][:username]
  group node[:elephant][:group]
end

files_path = File.expand_path '../../files/default/sublime_text/*.sublime-{settings,keymap}', __FILE__
Dir[files_path].map { |file| File.basename file }.each do |file|
  cookbook_file ::File.expand_path("Packages/User/#{file}", settings_path) do
    source "sublime_text/#{file}"
    owner node[:elephant][:username]
    group node[:elephant][:group]
  end
end

cookbook_file ::File.expand_path('Settings/Session.sublime_session', settings_path) do
  source "sublime_text/Session.sublime_session"
  owner node[:elephant][:username]
  group node[:elephant][:group]
end

remote_file ::File.expand_path("Installed Packages/Package Control.sublime-package", settings_path) do
  source 'http://sublime.wbond.net/Package%20Control.sublime-package'
  owner node[:elephant][:username]
  group node[:elephant][:group]
  action :create_if_missing
end

if license = node[:elephant][:sublime_text][:license]
  file ::File.expand_path('Settings/License.sublime_license', settings_path) do
    content license
    owner node[:elephant][:username]
    group node[:elephant][:group]
  end
end

node[:elephant][:sublime_text][:extensions].each do |type, extensions|
  file ::File.expand_path("Packages/User/#{type}.sublime-settings", settings_path) do
    content JSON.pretty_generate({:extensions => extensions}, :indent => "\t")
    owner node[:elephant][:username]
    group node[:elephant][:group]
  end
end

node[:elephant][:sublime_text][:packages].each do |package|
  git ::File.expand_path("Packages/#{package[:name]}", settings_path) do
    repository package[:source]
    user node[:elephant][:username]
    group node[:elephant][:group]
    action :sync
  end
end
