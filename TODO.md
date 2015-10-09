# TODO

## System

### Dock
* Only restart Dock if actual changes happened in Dock settings

### Firewall
* Allow DDService64d (Drobo Dashboard)

### Language & Text
* Languages order
* Region: change Numbers (decimal point and comma separator)

### Screensaver
* `'idleTime' => 300`
* Select screensaver:
```
'muduleDict' =>
  'moduleName': 'Flurry',
  'path': '/System/Library/Screen Savers/Flurry.saver',
  'type': 0`
```

### Keyboard
* Disable autocorrect

### Keyboard Shortcuts
* Disable F11/F12
* Disable ^ up/down
* Enable ^1 to switch to desktop 1
* Disable spotlight shortcuts
* Add Skype shortcuts:
  * Close Window: CMD+W
  * Close Conversation: CMD+SHIFT+W
  * Previous Conversation: CMD+SHIFT+[
  * Next Conversation: CMD+SHIFT+]
* Add Mail shortcuts:
  * Send: CMD + enter
  * Archive: CMD + shift + S
* Add HipChat shortcuts:
  * Close Window: CMD+W
  * Close Tab: CMD+SHIFT+W

### Preferences
* Click in the scrollbar to: Jump to the spot that's clicked
* OSX Dark theme
* Show bluetooth icon
* Show speaker icon
* Show battery percentage
* Enable screen sharing
* Require password after 15 minutes of sleep

### Ruby
* Make it possible to use gem_package when running a ruby managed by chruby: https://github.com/Atalanta/chef-chruby/issues/5#issuecomment-23155795

### Services
* Screen sharing

### Text formatting
* Change region settings (decimal point, etc.)

## System apps

### Calendar
* Hide new events count in Dock
* Don't include Mail.app events

### Contacts
* Sorting

### Finder
* Only restart Finder if actual changes happened in Finder settings

### Image Capture
* Connecting an iPhone does not open any apps

### iTunes
* Disable song notifications
* Show status bar

### Mail
* `'DefaultViewState': {'FavoritesBarVisible' => false}`
* Enable rules
* Signatures
* Inbox notifications: VIP Inbox
* Dock count: VIP Inbox
* Customize toolbar

### Notes
* Change default font:
```ruby
default[:elephant][:settings][:notes] = {
  'domain' => "#{ENV['HOME']}/Library/Containers/com.apple.Notes/Data/Library/Preferences/com.apple.Notes.plist",
  'NoteFont' => "<62706c69 73743030 d4010203 04050618 19582476 65727369 6f6e5824 6f626a65 63747359 24617263 68697665 72542474 6f701200 0186a0a4 07081112 55246e75 6c6cd409 0a0b0c0d 0e0f1056 4e535369 7a65584e 5366466c 61677356 4e534e61 6d655624 636c6173 7323402c 00000000 00001010 80028003 5948656c 76657469 6361d213 1415165a 24636c61 73736e61 6d655824 636c6173 73657356 4e53466f 6e74a215 17584e53 4f626a65 63745f10 0f4e534b 65796564 41726368 69766572 d11a1b54 726f6f74 80010811 1a232d32 373c424b 525b6269 72747678 8287929b a2a5aec0 c3c80000 00000000 01010000 00000000 001c0000 00000000 00000000 00000000 00ca>" # type: data
}
```

### Safari
* Hide bookmarks bar
* Customize toolbar
* Extensions
  * Invisible Status Bar
  * AdBlock
  * Pocket
* Set list of allowed java applets
* Don't open safe files after downloading

### Terminal
* Preferences
* ALT + backspace

## Third party apps

### 1Password
* Disable "Verify browser code signature" => Not implemented since this is a "secure" setting
* Install Safari Extension
* Install Chrome Extension
* Extension preferences
```ruby
remote_file "#{ENV['HOME']}/Library/Safari/Extensions/1Password.safariextz" do
  action :create_if_missing
  backup false
  source "http://aws.cachefly.net/dist/1P/ext/1Password.safariextz"
end

mac_os_x_userdefaults "Install 1Password Safari extension" do
  domain "#{ENV['HOME']}/Library/Safari/Extensions/Extensions.plist"
  sudo false
  key "Installed Extensions"
  value [{
    "Archive File Name" => "!Password-1.safariextz",
    "Bundle Directory Name" => "1Password.safariextension",
    "Enabled" => true
  }]
end

# In attributes:

default[:mac_os_x][:settings][:'1password_extension'] = {
  'domain' => "#{ENV['HOME']}/Library/Safari/Extensions/Extensions.plist",
  "Installed Extensions" => [
    {
      "Archive File Name" => "!Password-1.safariextz",
      "Bundle Directory Name" => "1Password.safariextension",
      "Enabled" => true
    }
  ]
}
```

### Adobe Reader
* Create recipe
* disable updates
* do not set as default reader
* Remove browser plugin
  * rm /Library/Internet Plug-Ins/AdobePDFViewer.plugin
  * rm /Library/Internet Plug-Ins/AdobePDFViewerNPAPI.plugin

### Alfred
* Change sync path to ~/Dropbox/Preferences: it does not want to store its preferences there
* change keyboard shortcut to CMD + space
```ruby
'hotkey.default' => {
  'key' => 49,
  'mod' => 1048576,
  'string' => 'Space'
}
```

### AppCleaner
* SmartDelete

### Charles
* License

### Cheatsheet
* enable access for assistive devices in System Preferences - Accessibility
* enable as login item

### Dash
* Docsets:
  * Bootstrap
  * Ruby
  * Ruby_2 (ruby2)
  * Ruby_on_Rails
  * RubyMotion
  * Ruby on Rails 2.3 (rails2) (https://raw.github.com/jipumarino/rails-2.3-docset/master/feed/Rails2.3.xml)

### Divvy
* Set "Enable access for assistive devices" in Universal Access in System Preferences
* Shortcuts: http://mizage.clarify-it.com/d/nxr9qg

### Drobo Dashboard
* remove `~/.Drobo_Dashboard_installer_os_version_check_log.txt`
* http://support.drobo.com/app/answers/detail/a_id/624 to fix java process issue

### Dropbox
* Enalbe "Use black and white menu bar icons"
* Disable "Enable Dropbox camera import"

### Google Chrome
* Preferences

### Max
* Output preferences
```ruby
'outputFormats' => [
  {
    'component' => 0,
    'name' => 'Apple MPEG-4 Audio (Apple Lossless)',
    'selected' => true,
    'settings' => {
      'fileType' => 1832149350,
      'formatID' => 1634492771,
      'extensionsForType' => [
        'm4a',
        'm4r'
      ],
      'sampleRate' => 0, # type: real
      'bitsPerChannel' => 0,
      'formatFlags' => 0
    }
  }
]
```

### Plex Home Theater
* Don't hardcode version

### Reeder
* All preferences (they are all dictionaries)

### Sequel Pro
* Favorites

### Spotify
* Disable launch on login

### TeamViewer
* Preferences
```ruby
mac_os_x_userdefaults 'com.teamviewer.teamviewer' do
  key 'Always_Online'
  value 0
end

%w[teamviewer teamviwer_desktop].each do |type|
  plist = "/Library/LaunchAgents/com.teamviewer.#{type}.plist"

  # execute "Unload #{plist}" do
  #   command "sudo launchctl unload #{plist}"
  #   ignore_failure true
  # end

  mac_os_x_userdefaults plist do
    key 'Disabled'
    value true
    sudo true
  end
end
```

### Transmission
* Keychain asks for password if it's not set

### Tunnelblick
* Preferences
* Configs

### VLC
* Preferences

### VPN
* output for keychain password check

## Various
* Notification settings

* Audio Hijack Pro
* Color Picker Pro
* Fission
* Sketch

* Pixelmator
* Renamer
* Skitch
* The Unarchiver

* TextEdit
* Time Machine

* Fonts

## Chef
* Automatically add elephant::settings at the end of the run list when needed
* Debug timeout issues. Currently the timeout is set to 10 minutes, but sometimes compiling a package exeeds that time.
* Debug why installing a lot of packages after each other takes such a long time. Note: during that time Dropbox was syncing and using 100% CPU.
* create keychain lwrp instead of doing custom calls. This way STDOUT output can easily be ignored and we could to ask to unlock the keychain if it is locked instead of always doing that.
