dmg_package 'Transmission' do
  source node[:elephant][:transmission][:url]
  checksum node[:elephant][:transmission][:checksum]
end
