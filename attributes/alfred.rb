default[:elephant][:alfred][:license] = nil

default[:elephant][:settings][:alfred] = {
  'domain' => 'com.runningwithcrayons.Alfred-Preferences',
  'features.clipboard.enabled' => true,
  'features.defaultresults.scope' => [
    '/Applications',
    '/Applications/Xcode.app/Contents/Applications',
    '/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/Applications',
    '/Developer/Applications',
    '/Library/PreferencePanes',
    '/System/Library/PreferencePanes',
    '~/Library/Caches/Metadata/',
    '~/Library/Mobile Documents/',
    '~/Library/PreferencePanes'
  ],
  'syncfolder' => '~/Dropbox'
}
