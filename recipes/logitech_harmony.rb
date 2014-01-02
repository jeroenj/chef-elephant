include_recipe 'elephant::silverlight'

dmg_package 'LogitechHarmonySoftware' do
  source node[:elephant][:logitech_harmony][:url]
  checksum node[:elephant][:logitech_harmony][:checksum]
  volumes_dir 'LogitechHarmonySoftware.pkg'
  type 'pkg'
  package_id 'com.logitech.harmony.harmonyBrowserPlugin.LogitechHarmony.pkg'
end
