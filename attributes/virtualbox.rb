default[:elephant][:virtualbox][:version] = '4.3.4-91027'
default[:elephant][:virtualbox][:url] = "http://download.virtualbox.org/virtualbox/#{node[:elephant][:virtualbox][:version].split('-').first}/VirtualBox-#{node[:elephant][:virtualbox][:version]}-OSX.dmg"
default[:elephant][:virtualbox][:checksum] = 'b14e427b1a5e11b91900849b22fbf49dd2a178c93520b03424e2d89d2daaf321'

default[:elephant][:settings][:virtualbox] = {
  'domain' => 'org.virtualbox.app.VirtualBox',
  'NSNavLastRootDirectory' => "#{ENV['HOME']}/VMs"
}
