# include elephant::settings at the end of the run list to include settings

homebrew_cask 'alfred'

if node[:elephant][:alfred][:license]
  directory "#{ENV['HOME']}/Library/Application Support/Alfred 2" do
    owner node[:elephant][:username]
    group node[:elephant][:group]
  end

  template "#{ENV['HOME']}/Library/Application Support/Alfred 2/license.plist" do
    source 'alfred/license.plist.erb'
    owner node[:elephant][:username]
    group node[:elephant][:group]
  end
end
