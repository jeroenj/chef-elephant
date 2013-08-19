default[:elephant][:cyberduck][:version] = '4.3.1'
default[:elephant][:cyberduck][:url] = "http://cyberduck.ch/Cyberduck-#{node[:elephant][:cyberduck][:version]}.zip"
default[:elephant][:cyberduck][:checksum] = '5a162b2dfc3c6a61b6ef91c6a4ac682161ca58b2'

default[:elephant][:cyberduck][:bookmarks] = []

default[:elephant][:settings][:cyberduck] = {
  'domain' => 'ch.sudo.cyberduck',
  'bookmark.icon.size' => 32,
  'browser.alternatingRows' => true,
  'browser.horizontalLines' => false,
  'connection.protocol.default' => 'sftp',
  'donate.reminder' => node[:elephant][:cyberduck][:version]
}
