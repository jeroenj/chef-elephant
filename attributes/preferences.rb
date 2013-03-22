default['mac_os_x']['settings']['firewall'] = {
  'domain' => '/Library/Preferences/com.apple.alf',
  'globalstate' => 1
}

default['mac_os_x']['settings']['global'] = {
  'domain' => 'NSGlobalDomain',
  'NSDocumentSaveNewDocumentsToCloud' => false
}


default['mac_os_x']['settings']['calendar'] = {
  'domain' => 'com.apple.iCal',
  'Disable shared calendar alerts' => true,
  'Show Week Numbers' => true
}

default['mac_os_x']['settings']['clock'] = {
  'domain' => 'com.apple.menuextra.clock',
  'DateFormat' => 'EEE d MMM  HH:mm'
}

default['mac_os_x']['settings']['dock'] = {
  'domain' => 'com.apple.dock',
  'showhidden' => true,
  'tilesize' => 48,
  'largesize' => 80
}

default['mac_os_x']['settings']['finder'] = {
  'domain' => 'com.apple.finder',
  'WarnOnEmptyTrash' => false,
  'ShowStatusBar' => true,
  'NewWindowTarget' => 'PfHm',
  'FXDefaultSearchScope' => 'SCcf'
}

default['mac_os_x']['settings']['itunes'] = {
  'domain' => 'com.apple.iTunes',
  'play-songs-while-importing' => false
}

default['mac_os_x']['settings']['mail'] = {
  'domain' => '/Users/jeroen/Library/Containers/com.apple.mail/Data/Library/Preferences/com.apple.mail.plist',
  'IndexJunk' => true,
  'JunkMailBehavior' => 2,
  'PollTime' => 1,
  'EnableToCCInMessageList' => true,
  'EnableContactPhotos' => true,
  'ShouldShowUnreadMessagesInBold' => true,
  'SuppressDeliveryFailure' => 1,
  'AutoReplyFormat' => true,
  'ThreadingDefault' => false,
  'NumberOfSnippetLines' => 0
}

default['mac_os_x']['settings']['safari'] = {
  'domain' => 'com.apple.safari',
  'IncludeDevelopMenu' => true,
  'HomePage' => 'https://www.google.be/',
  'AutoOpenSafeDownloads' => false
}

default['mac_os_x']['settings']['screensaver'] = {
  'domain' => 'com.apple.screensaver',
  'askForPasswordDelay' => 3600
}

default['mac_os_x']['settings']['terminal'] = {
  'domain' => 'com.apple.terminal',
  'Default Window Wettings' => 'Pro',
  'Startup Window Wettings' => 'Pro'
}

default['mac_os_x']['settings']['time_machine'] = {
  'domain' => 'com.apple.systempreferences',
  'TMShowUnsupportedNetworkVolumes' => true
}

default['mac_os_x']['settings']['trackpad'] = {
  'domain' => 'com.apple.driver.AppleBluetoothMultitouch.trackpad',
  'TrackpadThreeFingerHorizSwipeGesture' => 0,
  'Clicking' => true,
  'TrackpadThreeFingerVertSwipeGesture' => 0,
  'TrackpadFourFingerPinchGesture' => 2
}
