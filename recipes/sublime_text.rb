dmg_package 'Sublime Text' do
  source node[:elephant][:sublime_text][:url]
  checksum node[:elephant][:sublime_text][:checksum]
end

settings_path = "#{ENV['HOME']}/Library/Application Support/Sublime Text 3"

link '/usr/bin/subl' do
  to '/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl'
end

elephant_recursive_directory settings_path do
  owner node[:elephant][:username]
  group node[:elephant][:group]
end
elephant_recursive_directory "#{settings_path}/Packages/User" do
  owner node[:elephant][:username]
  group node[:elephant][:group]
end
elephant_recursive_directory "#{settings_path}/Local" do
  owner node[:elephant][:username]
  group node[:elephant][:group]
end
elephant_recursive_directory "#{settings_path}/Installed Packages" do
  owner node[:elephant][:username]
  group node[:elephant][:group]
end

node[:elephant][:sublime_text][:settings].each do |name, settings|
  file ::File.expand_path("Packages/User/#{name}.sublime-settings", settings_path) do
    content JSON.pretty_generate(settings, :indent => "\t")
    user node[:elephant][:username]
    group node[:elephant][:group]
  end
end

cookbook_file ::File.expand_path('Packages/User/Default (OSX).sublime-keymap', settings_path) do
  source 'sublime_text/Default (OSX).sublime-keymap'
  owner node[:elephant][:username]
  group node[:elephant][:group]
end

cookbook_file ::File.expand_path('Local/Session.sublime_session', settings_path) do
  source 'sublime_text/Session.sublime_session'
  owner node[:elephant][:username]
  group node[:elephant][:group]
end

remote_file ::File.expand_path('Installed Packages/Package Control.sublime-package', settings_path) do
  source 'http://sublime.wbond.net/Package%20Control.sublime-package'
  owner node[:elephant][:username]
  group node[:elephant][:group]
  action :create_if_missing
end

if license = node[:elephant][:sublime_text][:license]
  file ::File.expand_path('Local/License.sublime_license', settings_path) do
    content license
    owner node[:elephant][:username]
    group node[:elephant][:group]
  end
end

node[:elephant][:sublime_text][:extensions].each do |type, extensions|
  file ::File.expand_path("Packages/User/#{type}.sublime-settings", settings_path) do
    content JSON.pretty_generate({ :extensions => extensions }, :indent => "\t")
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
