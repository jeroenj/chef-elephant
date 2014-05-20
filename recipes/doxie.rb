homebrew_cask 'doxie'

preferences_directory = "#{ENV['HOME']}/Library/Preferences/Apparent/Doxie"

elephant_recursive_directory preferences_directory do
  owner node[:elephant][:username]
  group node[:elephant][:group]
end

cookbook_file "#{preferences_directory}/Preferences.xml" do
  source 'doxie/Preferences.xml'
  owner node[:elephant][:username]
  group node[:elephant][:group]
end
