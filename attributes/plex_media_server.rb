default[:elephant][:plex_media_server][:version] = '0.9.8.10.215-020456b'
default[:elephant][:plex_media_server][:url] = "http://downloads.plexapp.com/plex-media-server/#{node[:elephant][:plex_media_server][:version]}/PlexMediaServer-#{node[:elephant][:plex_media_server][:version]}-OSX.zip"
default[:elephant][:plex_media_server][:checksum] = '5c0d497990f60ee60507c8a08e8332782052c3ae'

default[:elephant][:settings][:plex_media_server] = {
  'domain' => 'com.plexapp.plexmediaserver',
  'AcceptedEULA' => true,
  'ApertureSharingEnabled' => false,
  'autoEmptyTrash' => true,
  'enableAirplayDolbyDigital' => true,
  'FirstRun' => false,
  'FSEventLibraryUpdatesEnabled' => true,
  'iPhotoSharingEnabled' => false,
  'ManualPortMappingMode' => true,
  'OnDeckWindow' => 52,
  'PublishServerOnPlexOnlineKey' => true,
  'ScheduledLibraryUpdateInterval' => 86400,
  'ScheduledLibraryUpdatesEnabled' => true,
  'showDockIcon' => true,
  'SUEnableAutomaticChecks' => true,
  'SUSendProfileInfo' => true
}
