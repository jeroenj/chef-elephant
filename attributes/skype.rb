default[:elephant][:skype][:version] = '6.3.0.582'
default[:elephant][:skype][:checksum] = '521962837f6f36060c444799150c6a747129a703b9beaea2e509f3c495eea0dc'

default[:elephant][:settings][:skype] = {
  'domain' => 'com.skype.skype',
  'DialpadOpen' => false,
  'DisableAllVisualNotifications' => true,
  'LastUserSidebarWidth' => 220,
  'ShowAddressBookContacts' => false,
  'ShowDialpadOnLogin' => false,
  'SKPauseITunes' => false,
  'SKShowSilentUpgradeNotice' => false,
  'SKShowSystemStatusBarItem' => false,
  'SKShowWelcomeTour' => false,
  'SKSilentUpgradeNoticeShown' => true,
  'SKUseGrowlInsteadOfDefault' => true,
  'SourceListLayoutMode' => false,
  'UserDefinedEvents' => '{' \
                         '  Busy = {' \
                         '    PlaySound = 0;' \
                         '  };' \
                         '  CallConnecting = {' \
                         '    PlaySound = 0;' \
                         '  };' \
                         '  ContactBecomesAvailable = {' \
                         '    PlaySound = 0;' \
                         '  };' \
                         '  ContactRequestReceived = {' \
                         '    PlaySound = 0;' \
                         '  };' \
                         '  ContactsReceived = {' \
                         '    PlaySound = 0;' \
                         '  };' \
                         '  FileTransferCompleted = {' \
                         '    PlaySound = 0;' \
                         '  };' \
                         '  FileTransferFailed = {' \
                         '    PlaySound = 0;' \
                         '  };' \
                         '  FirstMessageReceived = {' \
                         '    PlaySound = 0;' \
                         '  };' \
                         '  HangUp = {' \
                         '    PlaySound = 0;' \
                         '  };' \
                         '  HoldCall = {' \
                         '    PlaySound = 0;' \
                         '  };' \
                         '  IncomingCallWaiting = {' \
                         '    PlaySound = 0;' \
                         '  };' \
                         '  IncomingFileTransfer = {' \
                         '    PlaySound = 0;' \
                         '  };' \
                         '  MessageReceived = {' \
                         '    PlaySound = 0;' \
                         '  };' \
                         '  MessageSent = {' \
                         '    PlaySound = 0;' \
                         '  };' \
                         '  OutgoingCall = {' \
                         '    PlaySound = 0;' \
                         '  };' \
                         '  RemotePartyHungUp = {' \
                         '    PlaySound = 0;' \
                         '  };' \
                         '  ResumeCall = {' \
                         '    PlaySound = 0;' \
                         '  };' \
                         '  SignIn = {' \
                         '    PlaySound = 0;' \
                         '  };' \
                         '}'
}
