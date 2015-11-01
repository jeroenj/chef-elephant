# killall Dock is already defined in the mac_os_x cookbook

execute 'killall Finder' do
  action :nothing
end

node[:elephant][:settings].select { |recipe, _values| node.run_context.loaded_recipes.include?("elephant::#{recipe}") }.each do |_recipe, settings|
  settings.each do |key, value|
    next if key == 'domain'
    notify = case settings['domain']
             when /^com.apple.dock$/   then 'execute[killall Dock]'
             when /^com.apple.finder$/ then 'execute[killall Finder]'
    end

    mac_os_x_userdefaults "#{settings['domain']}-#{key}" do
      domain settings['domain']
      key key
      value value
      user node[:elephant][:username]
      sudo true if settings['domain'] =~ /^\/Library\/Preferences/
      global true if settings['domain'] =~ /^NSGlobalDomain$/
      notifies :run, notify if notify
    end
  end
end
