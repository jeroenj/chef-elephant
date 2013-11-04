cookbook_file "#{ENV['HOME']}/.vimrc" do
  source 'vim/vimrc'
end

cookbook_file "#{ENV['HOME']}/.vim/ftdetect/srt.vim" do
  source 'vim/ftdetect/srt.vim'
end

cookbook_file "#{ENV['HOME']}/.vim/syntax/srt.vim" do
  source 'vim/syntax/srt.vim'
end
