default['elephant']['alfred']['version'] = '1.3.3_267'
default['elephant']['alfred']['checksum'] = 'a5593b2ad706efef485438280094a6a0a543e39f2db102f0e6e6a5c64ccbdbe8'

default['mac_os_x']['settings']['alfred'] = {
  'domain' => 'com.alfredapp.Alfred',
  'user' => node['elephant']['user'],
  'hotMod' => 1048840, # cmd + space
  'weblocale' => 'Belgium',
  'scope.paths' => [
    '/Applications',
    '/Applications/Xcode.app/Contents/Applications',
    '/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/Applications',
    '/Library/PreferencePanes',
    '/System/Library/PreferencePanes'
  ],
  'applications.fuzzy' => true,
  'calculator.advanced' => true,
  'calculator.useComma' => true,
  'spelling.spell.paste' => true,
  'system.eject' => true,
  'appearance.hideHat' => true,
  'appearance.hideStatusBarIcon' => true,
  'appearance.autoHighlight' => false,
  'keyboard.locale' => 'com.apple.keylayout.US'
}
