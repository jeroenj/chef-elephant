default[:elephant][:alfred][:version] = '2.0.3_187'
default[:elephant][:alfred][:url] = "http://cachefly.alfredapp.com/Alfred_#{node[:elephant][:alfred][:version]}.zip"
default[:elephant][:alfred][:checksum] = 'd49b747ef4a2b49f401501f813f4cb345b899c691202f998233a03fea06bc0a9'

default[:mac_os_x][:settings][:alfred] = {
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
  'syncfolder' =>'~/Dropbox/Preferences'
}
