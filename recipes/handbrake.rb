dmg_package 'Handbrake' do
  source node[:elephant][:handbrake][:url]
  checksum node[:elephant][:handbrake][:checksum]
  volumes_dir "HandBrake-#{node[:elephant][:handbrake][:version]}-MacOSX.6_GUI_x86_64"
end
