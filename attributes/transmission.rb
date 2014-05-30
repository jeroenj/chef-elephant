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

default[:elephant][:transmission][:launch_agent] = {
  'Label' => 'transmission',
  'Program' => "#{ENV['HOME']}/Applications/Transmission.app/Contents/MacOS/Transmission",
  'RunAtLoad' => true,
  'KeepAlive' => {
    'SuccessfulExit' => false
  }
}
