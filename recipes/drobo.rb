dmg_package 'Drobo Dashboard' do
  source node['elephant']['drobo']['url']
  checksum node['elephant']['drobo']['checksum']
  volumes_dir 'Drobo Dashboard Installer'
  dmg_name 'Drobo Dashboard Installer'
  app "Install.app/Contents/Drobo_Dashboard_Installer_#{node['elephant']['drobo']['version']}"
  package_id 'com.datarobotics.drobodashboard'
  type 'pkg'
end
