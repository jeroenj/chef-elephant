dmg_package 'LogitechRemoteSoftware' do
  source node[:elephant][:logitech_harmony][:url]
  checksum node[:elephant][:logitech_harmony][:checksum]
  type 'pkg'
  package_id 'com.logitech.harmony.logitechRemoteSoftware.LogitechHarmonyRemoteSoftware.pkg'
end
