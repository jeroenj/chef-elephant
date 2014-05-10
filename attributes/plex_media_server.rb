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

default[:elephant][:plex_media_server][:launch_agent] = {
  'Label' => 'plex-media-server',
  'ProgramArguments' => [
    '/Applications/Plex Media Server.app/Contents/MacOS/Plex Media Server',
    '-start'
  ],
  'RunAtLoad' => true,
  'KeepAlive' => {
    'SuccessfulExit' => false
  }
}
