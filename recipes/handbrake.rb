dmg_package 'Handbrake' do
  volumes_dir "HandBrake-#{node['elephant']['handbrake']['version']}-MacOSX.6_GUI_x86_64"
  source "http://handbrake.fr/rotation.php?file=HandBrake-#{node['elephant']['handbrake']['version']}-MacOSX.6_GUI_x86_64.dmg"
  checksum node['elephant']['handbrake']['checksum']
  owner node['elephant']['user']
end
