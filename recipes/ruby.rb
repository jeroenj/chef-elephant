%w(gemrc irbrc pryrc spring.rb).each do |file|
  cookbook_file "#{ENV['HOME']}/.#{file}" do
    source "ruby/#{file}"
    owner node[:elephant][:username]
    group node[:elephant][:group]
  end
end

node[:elephant][:ruby][:gems].each do |gem|
  gem_package gem[:name] do
    version gem[:version]
  end
end
