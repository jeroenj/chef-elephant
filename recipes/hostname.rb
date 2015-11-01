%w(ComputerName LocalHostName HostName).each do |type|
  execute "Set #{type} to #{node[:elephant][:hostname]}" do
    command "scutil --set #{type} #{node[:elephant][:hostname]}"
    not_if { `scutil --get #{type}`.strip == node[:elephant][:hostname] }
  end
end
