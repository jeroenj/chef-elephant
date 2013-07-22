dmg_package 'Vagrant' do
  source node[:elephant][:vagrant][:url]
  checksum node[:elephant][:vagrant][:checksum]
  type 'pkg'
  # package_id 'be.eid.middleware'
end
