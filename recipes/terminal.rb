# include elephant::settings at the end of the run list to include settings

file "#{ENV['HOME']}/.hushlogin" do
  action :touch
end
