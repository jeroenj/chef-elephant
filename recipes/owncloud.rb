dmg_package 'ownCloud' do
  source node[:elephant][:owncloud][:url]
  checksum node[:elephant][:owncloud][:checksum]
end
