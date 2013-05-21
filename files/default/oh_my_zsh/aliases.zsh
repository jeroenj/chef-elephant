# Ruby (on Rails)
alias logd='tail -f log/development.log'
alias logt='tail -f log/test.log'
alias loge='tail -f /var/log/apache2/error_log'

alias rst='touch tmp/restart.txt'

alias uninstall_all_gems='gem list | cut -d" " -f1 | xargs gem uninstall -aIx'

# Zeus
alias zrake='zeus rake'

# MySQL
alias mysql_start='launchctl load -w ~/Library/LaunchAgents/com.mysql.mysqld.plist'
alias mysql_stop='launchctl unload -w ~/Library/LaunchAgents/com.mysql.mysqld.plist'
