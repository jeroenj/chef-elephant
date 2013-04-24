dmg_package 'VirtualBox' do
  source node['elephant']['virtualbox']['url']
  checksum node['elephant']['virtualbox']['checksum']
  owner node['elephant']['user']
  type 'pkg'
  package_id 'org.virtualbox.pkg.virtualbox'
end
