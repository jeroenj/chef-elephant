dmg_package 'VirtualBox' do
  source node[:elephant][:virtualbox][:url]
  checksum node[:elephant][:virtualbox][:checksum]
  type 'pkg'
  package_id 'org.virtualbox.pkg.virtualbox'
end
