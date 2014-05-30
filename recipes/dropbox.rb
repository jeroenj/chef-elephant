homebrew_cask 'dropbox'

link "#{ENV['HOME']}/Development" do
  to "#{ENV['HOME']}/Dropbox/Development"
  owner node[:elephant][:username]
  group node[:elephant][:group]
end
