hostname = node[:elephant][:hostname]

log "My hostname: #{hostname}"

# The scutil commands need to run as root, unless
# you're logged into the console, but we can't be sure of that.

[
  "scutil --set ComputerName #{hostname}",
  "scutil --set LocalHostName #{hostname}",
  "scutil --set HostName #{hostname}",
  "hostname #{hostname}",
  "diskutil rename / #{hostname}"
].each do |command|
  execute command
end

ruby_block "test to see if hostname was set" do
  block do
    raise "Setting of hostname failed" unless hostname == `scutil --get ComputerName`.chop
  end
end
