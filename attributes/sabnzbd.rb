default[:elephant][:sabnzbd][:version] = '0.7.14'
default[:elephant][:sabnzbd][:url] = "http://sourceforge.net/projects/sabnzbd/files/sabnzbd/#{node[:elephant][:sabnzbd][:version]}/SABnzbd-#{node[:elephant][:sabnzbd][:version]}-osx.dmg/download"
default[:elephant][:sabnzbd][:shasum] = '06b2cc099e78b8c70ff606867064f3fd60b22dc7'

default[:elephant][:sabnzbd][:preferences][:https] = 0
