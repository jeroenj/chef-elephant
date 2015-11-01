default[:elephant][:logrotate][:files] = [
  {
    filename: "#{ENV['HOME']}/Development/*/*/log/*.log",
    owner_group: "#{node[:elephant][:username]}:staff",
    mode: 644,
    count: 0,
    size: 4096,
    when: '*',
    flags: 'G'
  }
]
