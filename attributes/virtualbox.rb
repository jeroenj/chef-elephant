default[:elephant][:virtualbox][:version] = '4.3.2-90405'
default[:elephant][:virtualbox][:url] = "http://download.virtualbox.org/virtualbox/#{node[:elephant][:virtualbox][:version].split('-').first}/VirtualBox-#{node[:elephant][:virtualbox][:version]}-OSX.dmg"
default[:elephant][:virtualbox][:checksum] = 'de6d2c433b259162ba68156531954cf4c7fd192e8b47e72ea486988e4fe5939e'

default[:elephant][:settings][:virtualbox] = {
  'domain' => 'org.virtualbox.app.VirtualBox',
  'NSNavLastRootDirectory' => "#{ENV['HOME']}/VMs"
}
