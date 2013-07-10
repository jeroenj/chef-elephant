# include elephant::settings at the end of the run list to include settings

cookbook_file "#{ENV['HOME']}/Library/Safari/TopSites.plist" do
  source 'safari/TopSites.plist'
end
