template "#{ENV['HOME']}/.ssh/config" do
  source 'ssh/config.erb'
end
