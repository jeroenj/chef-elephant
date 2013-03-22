default['elephant']['virtualbox']['version'] = '4.2.10-84104'
default['elephant']['virtualbox']['checksum'] = '1c53a4b14c91189f162e841145cc38316957be49a63431286ca901746818fc04'

default['mac_os_x']['settings']['virtualbox'] = {
  'domain' => 'ws.agile.1password',
  'user' => node['elephant']['user'],
  'NSNavLastRootDirectory' => "#{ENV['HOME']}/VMs"
}
