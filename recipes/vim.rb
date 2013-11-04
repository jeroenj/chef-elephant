cookbook_file "#{ENV['HOME']}/.vimrc" do
  source 'vim/vimrc'
end

directory "#{ENV['HOME']}/.vim/ftdetect" do
  recursive true
end

cookbook_file "#{ENV['HOME']}/.vim/ftdetect/srt.vim" do
  source 'vim/ftdetect/srt.vim'
end

directory "#{ENV['HOME']}/.vim/syntax" do
  recursive true
end

cookbook_file "#{ENV['HOME']}/.vim/syntax/srt.vim" do
  source 'vim/syntax/srt.vim'
end
