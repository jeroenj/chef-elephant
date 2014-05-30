default[:elephant][:sabnzbd][:preferences][:https] = 0
default[:elephant][:sabnzbd][:preferences][:https_port] = 9090
default[:elephant][:sabnzbd][:preferences][:https_key] = '""'
default[:elephant][:sabnzbd][:preferences][:https_cert] = '""'
default[:elephant][:sabnzbd][:preferences][:osx_speed] = 0
default[:elephant][:sabnzbd][:preferences][:schedule] = []
default[:elephant][:sabnzbd][:preferences][:servers] = []

default[:elephant][:sabnzbd][:launch_agent] = {
  'Label' => 'sabnzbd',
  'Program' => "#{ENV['HOME']}/Applications/SABnzbd.app/Contents/MacOS/SABnzbd",
  'RunAtLoad' => true,
  'KeepAlive' => {
    'SuccessfulExit' => false
  }
}
