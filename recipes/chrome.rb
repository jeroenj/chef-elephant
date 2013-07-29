dmg_package 'Google Chrome' do
  dmg_name 'googlechrome'
  source node[:elephant][:chrome][:url]
  checksum node[:elephant][:chrome][:checksum]
end
