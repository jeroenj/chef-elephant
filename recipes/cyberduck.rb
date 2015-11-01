# include elephant::settings at the end of the run list to include settings

homebrew_cask 'cyberduck'

elephant_recursive_directory "#{ENV['HOME']}/Library/Application Support/Cyberduck/Bookmarks" do
  owner node[:elephant][:username]
  group node[:elephant][:group]
end

node[:elephant][:cyberduck][:bookmarks].each do |bookmark|
  template "#{ENV['HOME']}/Library/Application Support/Cyberduck/Bookmarks/#{bookmark[:nickname]}.duck" do
    source 'cyberduck/bookmark.duck.erb'
    variables(
      hostname: bookmark[:hostname],
      nickname: bookmark[:nickname],
      port: bookmark[:port],
      protocol: bookmark[:protocol],
      username: bookmark[:username]
    )
    owner node[:elephant][:username]
    group node[:elephant][:group]
  end
end
