default[:elephant][:transmission][:version] = '2.81'
default[:elephant][:transmission][:url] = "http://download.transmissionbt.com/files/Transmission-#{node[:elephant][:transmission][:version]}.dmg"
default[:elephant][:transmission][:shasum] = '5a9bc9d0f3d8d9c247eef99814f28cd177efa97b'

default[:elephant][:settings][:transmission] = {
  'domain' => 'org.m0k.transmission',
  'AutoSize' => true,
  'CheckUpload' => true,
  'DeleteOriginalTorrent' => true,
  'DownloadLocationConstant' => true,
  'InfoVisible' => false,
  'NSNavLastRootDirectory' => '~/Downloads',
  'RPC' => true,
  'RPCAuthorize' => true,
  'RPCWebDiscovery' => true,
  'UploadLimit' => 96,
  'WarningDonate' => false,
  'WarningLegal' => false
}
