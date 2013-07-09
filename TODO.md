# TODO

## System

### Dock
* Only restart Dock if actual changes happened in Dock settings

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

## System apps

### Mail
* `'DefaultViewState': {'FavoritesBarVisible' => false}`
* Enable rules
* Signatures
* Inbox notifications: VIP Inbox
* Dock count: VIP Inbox
* Customize toolbar

### Safari
* Set top sites
* Hide bookmarks bar
* Customize toolbar

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
* HUD
* Disable menu bar icon
* Disable dismiss main window
* Launch on login

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

### Tunnelblick
* Preferences
* Configs

### VLC
* Preferences

## Configs
### oh-my-zsh
* Only try to set default shell to zsh if it isn't already
