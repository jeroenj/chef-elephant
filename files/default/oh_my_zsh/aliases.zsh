# Ruby (on Rails)
alias logd='tail -f log/development.log'
alias logt='tail -f log/test.log'

alias rst='touch tmp/restart.txt'

alias dbm='bin/rake db:migrate db:test:prepare'

alias uninstall_all_gems='gem list | cut -d" " -f1 | xargs gem uninstall -aIx'

# Foreman
alias fm='foreman start -f Procfile.dev'

# MySQL
alias mysql_start='launchctl load -w ~/Library/LaunchAgents/com.mysql.mysqld.plist'
alias mysql_stop='launchctl unload -w ~/Library/LaunchAgents/com.mysql.mysqld.plist'

# dig
alias dog='dig +short'

# git
alias gf='git fetch -p origin'

# tig
alias ts='tig status'

# knife
alias knife='nocorrect knife'

# ifconfig
alias ip='ifconfig | grep "inet " | grep -v 127.0.0.1 | cut -d\  -f2'
alias rip='curl ipecho.net/plain ; echo'
