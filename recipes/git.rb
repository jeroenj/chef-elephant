cookbook_file "#{ENV['HOME']}/.gitignore" do
  source 'git/gitignore'
end

if node[:recipes].include?('elephant::oh_my_zsh')
  cookbook_file "#{ENV['HOME']}/.oh-my-zsh/custom/git.zsh" do
    source 'git/git.zsh'
  end
end

template "#{ENV['HOME']}/.gitconfig" do
  source 'git/gitconfig.erb'
end
