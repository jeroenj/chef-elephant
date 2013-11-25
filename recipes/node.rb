package 'node'

node[:elephant][:node][:packages].each do |package|
  # A bit nasty: coffee-script has coffee as an executable
  executable = package.split('-').first

  execute "npm install -g #{package}" do
    not_if { ::File.exists? "/usr/local/share/npm/bin/#{executable}" }
  end
end
