default[:mac_os_x][:settings][:global] = {
  'domain' => 'NSGlobalDomain',
  'NSAllowContinuousSpellChecking' => false,
  'NSDocumentSaveNewDocumentsToCloud' => false
}

default[:mac_os_x][:settings][:clock] = {
  'domain' => 'com.apple.menuextra.clock',
  'DateFormat' => 'EEE d MMM  HH:mm'
}

default[:mac_os_x][:settings][:dock] = {
  'domain' => 'com.apple.dock',
  'largesize' => 80,
  'magnification' => true,
  'minimize-to-application' => true,
  'showhidden' => true,
  'tilesize' => 48
}

default[:mac_os_x][:settings][:keyboard] = {
  'domain' => '.GlobalPreferences',
  'KeyRepeat' => 2,
  'InitialKeyRepeat' => 15
}

default[:mac_os_x][:settings][:light_sensor] = {
  'domain' => '/Library/Preferences/com.apple.iokit.AmbientLightSensor',
  'Automatic Display Enabled' => false
}

default[:mac_os_x][:settings][:login] = {
  'domain' => '/Library/Preferences/com.apple.loginwindow',
  'GuestEnabled' => true
}

default[:mac_os_x][:settings][:screensaver] = {
  'domain' => 'com.apple.screensaver',
  'askForPasswordDelay' => 3600
}

default[:mac_os_x][:settings][:time_machine] = {
  'domain' => 'com.apple.systempreferences',
  'TMShowUnsupportedNetworkVolumes' => true
}

default[:mac_os_x][:settings][:trackpad] = {
  'domain' => 'com.apple.AppleMultitouchTrackpad',
  'Clicking' => true,
  'Dragging' => 0,
  'DragLock' => false,
  'TrackpadCornerSecondaryClick' => 0,
  'TrackpadFiveFingerPinchGesture' => 2,
  'TrackpadFourFingerHorizSwipeGesture' => 2,
  'TrackpadFourFingerPinchGesture' => 2,
  'TrackpadFourFingerVertSwipeGesture' => 2,
  'TrackpadHorizScroll' => 1,
  'TrackpadMomentumScroll' => true,
  'TrackpadPinch' => 1,
  'TrackpadRightClick' => true,
  'TrackpadRotate' => 1,
  'TrackpadScroll' => true,
  'TrackpadThreeFingerDrag' => false,
  'TrackpadThreeFingerHorizSwipeGesture' => 0,
  'TrackpadThreeFingerTapGesture' => 2,
  'TrackpadThreeFingerVertSwipeGesture' => 0,
  'TrackpadTwoFingerDoubleTapGesture' => 1,
  'TrackpadTwoFingerFromRightEdgeSwipeGesture' => 3,
  'UserPreferences' => true
}

default[:mac_os_x][:settings][:wireless_trackpad] = node[:mac_os_x][:settings][:trackpad].merge({
  'domain' => 'com.apple.driver.AppleBluetoothMultitouch.trackpad'
})
