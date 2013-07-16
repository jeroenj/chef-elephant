dmg_package 'Firefox' do
  source node[:elephant][:firefox][:url]
  checksum node[:elephant][:firefox][:checksum]
end
