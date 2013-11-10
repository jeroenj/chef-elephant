dmg_package 'Drobo Dashboard' do
  source node[:elephant][:drobo][:url]
  checksum node[:elephant][:drobo][:checksum]
  volumes_dir 'Drobo Dashboard Installer'
  dmg_name 'Drobo Dashboard Installer'
  app "Install.app/Contents/Drobo_Dashboard_Installer_#{node[:elephant][:drobo][:version]}"
  package_id 'com.datarobotics.drobodashboard'
  type 'pkg'
end

installation_log_file = "#{ENV['HOME']}/.Drobo_Dashboard_installer_os_version_check_log.txt"

execute "sudo chown #{node[:elephant][:username]}:staff #{installation_log_file}" do
  only_if { ::File.exists? installation_log_file }
end

file installation_log_file do
  action :delete
end

settings_path = "#{ENV['HOME']}/Library/Application Support/Drobo Dashboard"

directory ::File.expand_path('Appclicks', settings_path) do
  recursive true
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
  action :create_if_missing
end
