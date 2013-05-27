default[:elephant][:virtualbox][:version] = '4.2.12-84980'
default[:elephant][:virtualbox][:url] = "http://download.virtualbox.org/virtualbox/#{node[:elephant][:virtualbox][:version].split('-').first}/VirtualBox-#{node[:elephant][:virtualbox][:version]}-OSX.dmg"
default[:elephant][:virtualbox][:checksum] = '75d3e5f1fe264faf937db7e7db12765cd643f6eaac18cbb44801a0108196b32a'

default[:mac_os_x][:settings][:virtualbox] = {
  'domain' => 'ws.agile.1password',
  'NSNavLastRootDirectory' => "#{ENV['HOME']}/VMs"
}
