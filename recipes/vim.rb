package 'vim'

cookbook_file "#{ENV['HOME']}/.vimrc" do
  source 'vim/vimrc'
  owner node[:elephant][:username]
  group node[:elephant][:group]
end

elephant_recursive_directory "#{ENV['HOME']}/.vim/ftdetect" do
  owner node[:elephant][:username]
  group node[:elephant][:group]
end

cookbook_file "#{ENV['HOME']}/.vim/ftdetect/srt.vim" do
  source 'vim/ftdetect/srt.vim'
  owner node[:elephant][:username]
  group node[:elephant][:group]
end

elephant_recursive_directory "#{ENV['HOME']}/.vim/syntax" do
  owner node[:elephant][:username]
  group node[:elephant][:group]
end

cookbook_file "#{ENV['HOME']}/.vim/syntax/srt.vim" do
  source 'vim/syntax/srt.vim'
  owner node[:elephant][:username]
  group node[:elephant][:group]
end
