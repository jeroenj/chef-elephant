cookbook_file "#{ENV['HOME']}/.gitignore" do
  source 'git/gitignore'
end

cookbook_file "#{ENV['HOME']}/.oh-my-zsh/custom/git.zsh" do
  source 'git/git.zsh'
  only_if { Dir.exists? "#{ENV['HOME']}/.oh-my-zsh/custom" }
end

template "#{ENV['HOME']}/.gitconfig" do
  source 'git/gitconfig.erb'
end
