dmg_package 'VirtualBox' do
  source "http://download.virtualbox.org/virtualbox/#{node['elephant']['virtualbox']['version'].split('-').first}/VirtualBox-#{node['elephant']['virtualbox']['version']}-OSX.dmg"
  checksum node['elephant']['virtualbox']['checksum']
  owner node['elephant']['user']
  type 'pkg'
  package_id 'org.virtualbox.pkg.virtualbox'
end
