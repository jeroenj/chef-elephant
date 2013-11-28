default[:elephant][:sabnzbd][:version] = '0.7.16'
default[:elephant][:sabnzbd][:url] = "http://downloads.sourceforge.net/project/sabnzbdplus/sabnzbdplus/#{node[:elephant][:sabnzbd][:version]}/SABnzbd-#{node[:elephant][:sabnzbd][:version]}-osx.dmg"
default[:elephant][:sabnzbd][:shasum] = '27c957bb2b68a84c8ba8aa2de4a761b4851873f0'

default[:elephant][:sabnzbd][:preferences][:https] = 0
default[:elephant][:sabnzbd][:preferences][:https_port] = 9090
default[:elephant][:sabnzbd][:preferences][:https_key] = '""'
default[:elephant][:sabnzbd][:preferences][:https_cert] = '""'
default[:elephant][:sabnzbd][:preferences][:osx_speed] = 0
default[:elephant][:sabnzbd][:preferences][:schedule] = []
default[:elephant][:sabnzbd][:preferences][:servers] = []

default[:elephant][:sabnzbd][:launch_agent] = {
  'Label' => 'sabnzbd',
  'Program' => '/Applications/SABnzbd.app/Contents/MacOS/SABnzbd',
  'RunAtLoad' => true,
  'KeepAlive' => {
    'SuccessfulExit' => false
  }
}
