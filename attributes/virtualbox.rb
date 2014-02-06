default[:elephant][:virtualbox][:version] = '4.3.6-91406'
default[:elephant][:virtualbox][:url] = "http://download.virtualbox.org/virtualbox/#{node[:elephant][:virtualbox][:version].split('-').first}/VirtualBox-#{node[:elephant][:virtualbox][:version]}-OSX.dmg"
default[:elephant][:virtualbox][:checksum] = '60678b7cc7dc741b800cfc99c7ff73a185c548af877071eb82422f354e76bca2'

default[:elephant][:settings][:virtualbox] = {
  'domain' => 'org.virtualbox.app.VirtualBox',
  'NSNavLastRootDirectory' => "#{ENV['HOME']}/VMs"
}
