include_recipe 'elephant::zsh'

git "#{ENV['HOME']}/.zprezto" do
  repository node[:elephant][:prezto][:url]
  action :sync
  enable_submodules true
  user node[:elephant][:username]
  group node[:elephant][:group]
end

%w(zlogin zlogout zpreztorc zprofile zshenv zshrc).each do |file|
  link "#{ENV['HOME']}/.#{file}" do
    to "#{ENV['HOME']}/.zprezto/runcoms/#{file}"
    user node[:elephant][:username]
    group node[:elephant][:group]
  end
end
