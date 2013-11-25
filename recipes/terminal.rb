# include elephant::settings at the end of the run list to include settings

file "#{ENV['HOME']}/.hushlogin" do
  owner node[:elephant][:username]
  group node[:elephant][:group]
end
