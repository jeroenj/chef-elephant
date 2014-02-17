package 'node'

node[:elephant][:node][:packages].each do |package|
  # A bit nasty: coffee-script has coffee as an executable
  executable = package.split('-').first

  execute "npm install -g #{package}" do
    user node[:elephant][:username]
    group node[:elephant][:group]
    not_if { ::File.exists? "/usr/local/share/npm/bin/#{executable}" }
  end
end
