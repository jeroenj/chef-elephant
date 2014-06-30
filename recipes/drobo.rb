homebrew_cask 'drobo-dashboard'

file "#{ENV['HOME']}/.Drobo_Dashboard_installer_os_version_check_log.txt" do
  action :delete
end

settings_path = "#{ENV['HOME']}/Library/Application Support/Drobo Dashboard"

elephant_recursive_directory ::File.expand_path('Appclicks', settings_path) do
  owner node[:elephant][:username]
  group node[:elephant][:group]
end

plist_preferences = {
  'ACCleanQuit' => true,
  'ACEnableService' => false,
  'ACExistingUser' => true
}

plist_preferences.each do |key, value|
  mac_os_x_userdefaults "Drobo => #{key}: #{value}" do
    domain ::File.expand_path('Appclicks/appclicks.plist', settings_path)
    key key
    value value
  end
end

cookbook_file ::File.expand_path('settings.xml', settings_path) do
  source 'drobo/settings.xml'
  owner node[:elephant][:username]
  group node[:elephant][:group]
  action :create_if_missing
end
