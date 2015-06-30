package 'node'

node[:elephant][:node][:packages].each do |package|
  execute "npm install -g #{package}" do
    user node[:elephant][:username]
    group node[:elephant][:group]
    not_if "npm list #{package} version -g --silent > /dev/null"
  end
end
