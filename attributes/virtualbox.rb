default[:elephant][:virtualbox][:version] = '4.2.16-86992'
default[:elephant][:virtualbox][:url] = "http://download.virtualbox.org/virtualbox/#{node[:elephant][:virtualbox][:version].split('-').first}/VirtualBox-#{node[:elephant][:virtualbox][:version]}-OSX.dmg"
default[:elephant][:virtualbox][:checksum] = 'be67d3b62aea6734f6003ea3e25e07c05d267e8289df379c27493dd0320ac7bb'

default[:elephant][:settings][:virtualbox] = {
  'domain' => 'org.virtualbox.app.VirtualBox',
  'NSNavLastRootDirectory' => "#{ENV['HOME']}/VMs"
}
