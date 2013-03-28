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
  'largesize' => 80,
  'showhidden' => true,
  'tilesize' => 48
}

default['mac_os_x']['settings']['finder'] = {
  'domain' => 'com.apple.finder',
  'FXDefaultSearchScope' => 'SCcf',
  'NewWindowTarget' => 'PfHm',
  'ShowStatusBar' => true,
  'WarnOnEmptyTrash' => false
}

default['mac_os_x']['settings']['itunes'] = {
  'domain' => 'com.apple.iTunes',
  'play-songs-while-importing' => false
}

default['mac_os_x']['settings']['mail'] = {
  'domain' => '/Users/jeroen/Library/Containers/com.apple.mail/Data/Library/Preferences/com.apple.mail.plist',
  'AutoReplyFormat' => true,
  'EnableContactPhotos' => true,
  'EnableToCCInMessageList' => true,
  'IndexJunk' => true,
  'JunkMailBehavior' => 2,
  'NumberOfSnippetLines' => 0,
  'PollTime' => 1,
  'ShouldShowUnreadMessagesInBold' => true,
  'SuppressDeliveryFailure' => 1,
  'ThreadingDefault' => false
}

default['mac_os_x']['settings']['safari'] = {
  'domain' => 'com.apple.safari',
  'AutoFillPasswords' => false,
  'AutoOpenSafeDownloads' => false,
  'DownloadsClearingPolicy' => 1,
  'HistoryAgeInDaysLimit' => 365000,
  'HomePage' => '',
  'IncludeDevelopMenu' => true,
  'NewWindowBehavior' => 4,
  'SendDoNotTrackHTTPHeader' => true,
  'TabCreationPolicy' => 2
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
  'Clicking' => true,
  'TrackpadFourFingerPinchGesture' => 2,
  'TrackpadThreeFingerHorizSwipeGesture' => 0,
  'TrackpadThreeFingerVertSwipeGesture' => 0
}


default['mac_os_x']['settings']['reeder'] = {
  'domain' => '/Users/jeroen/Library/Containers/com.reederapp.mac/Data/Library/Preferences/com.reederapp.mac.plist',
  'SyncInterval' => 5,
  'ServiceBlogDisabled' => true,
  'ServiceBrowserShowInToolbar' => true,
  'ServiceDeliciousShowInToolbar' => true,
  'ServiceEvernoteDisabled' => true,
  'ServiceGoogleMobilizerDisabled' => true,
  'ServiceInstapaperDisabled' => true,
  'ServiceInstapaperMobilizerDisabled' => true,
  'ServicePinboardDisabled' => true,
  'ServiceQuoteFmReadLaterDisabled' => true,
  'ServiceQuoteFmReadLaterDisabled' => true,
  'ServiceQuoteFmRecommendDisabled' => true,
  'ServiceReadabilityDisabled' => true,
  'ServiceReadabilityShowInToolbar' => false,
  'ServiceReadItLaterShowInToolbar' => true,
  'ServiceSafariReadingListDisabled' => true,
  'ServiceZootoolDisabled' => true
}
