default[:elephant][:alfred][:version] = '2.1.1_227'
default[:elephant][:alfred][:url] = "http://cachefly.alfredapp.com/Alfred_#{node[:elephant][:alfred][:version]}.zip"
default[:elephant][:alfred][:checksum] = 'd19fe7441c6741bf663521e561b842f35707b1e83de21ca195aa033cade66d1b'

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
  'syncfolder' => '~/Dropbox/Preferences'
}
