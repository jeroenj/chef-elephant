dmg_package 'Tunnelblick' do
  dmg_name "Tunnelblick_#{node[:elephant][:tunnelblick][:version]}.dmg"
  source node[:elephant][:tunnelblick][:url]
  checksum node[:elephant][:tunnelblick][:checksum]
end
