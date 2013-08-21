# TODO

## System

### Dock
* Only restart Dock if actual changes happened in Dock settings

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

## System apps

### Finder
* Only restart Finder if actual changes happened in Finder settings

### Mail
* `'DefaultViewState': {'FavoritesBarVisible' => false}`
* Enable rules
* Signatures
* Inbox notifications: VIP Inbox
* Dock count: VIP Inbox
* Customize toolbar

### Safari
* Hide bookmarks bar
* Customize toolbar
* Extensions
  * Invisible Status Bar
  * AdBlock
  * Pocket
  * Delicious
* Set list of allowed java applets

### Terminal
* Preferences
* ALT + backspace

## Third party apps

### 1Password
* Install Safari Extension
* Install Chrome Extension
* Extension preferences

### Alfred
* change keyboard shortcut to CMD + space

### AppCleaner
* SmartDelete

### Charles
* Accept eula during install (issue in dmg cookbook)
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

### Drobo Dashboard
* Preferences are forgotten
* remove `~/.Drobo_Dashboard_installer_os_version_check_log.txt`
* http://support.drobo.com/app/answers/detail/a_id/624 to fix java process issue

### Dropbox
* Enalbe "Use black and white menu bar icons"
* Disable "Enable Dropbox camera import"

### Google Chrome
* Preferences

### Max
* Output preferences

### Plex Media Center
* Preferences

### SABnzbd
* Use dmg_resource instead of custom implementation

### Sublime Text
* Enhance package installing with new package control (if possible?)

### Tranmission
* Preferences

### Tunnelblick
* Preferences
* Configs

### VLC
* Preferences

## Various
* Notification settings

* Audio Hijack Pro
* Color Picker Pro
* Fission
* iDentify
* iPhone Explorer
* iStat Server
* Plex Media Server
* Preen
* Rowmote Helper
* Sketch
* TeamViewer

* Growl
* Osfoora
* Pixelmator
* Renamer
* Skitch
* SoundCloud
* SpriteRight
* The Unarchiver

* TextEdit
* Time Machine

* Google Sketchup

* Fonts

## Chef
* Automatically add elephant::settings at the end of the run list when needed
* Debug timeout issues. Currently the timeout is set to 10 minutes, but sometimes compiling a package exeeds that time.
* Debug why installing a lot of packages after each other takes such a long time. Note: during that time Dropbox was syncing and using 100% CPU.
