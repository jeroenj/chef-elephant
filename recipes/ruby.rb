%w[gemrc irbrc].each do |file|
  cookbook_file "#{ENV['HOME']}/.#{file}" do
    source "ruby/#{file}"
    owner node[:elephant][:username]
    group node[:elephant][:group]
  end
end

if node[:elephant][:ruby][:rubocop][:config]
  file "#{ENV['HOME']}/.rubocop.yml" do
    content node[:elephant][:ruby][:rubocop][:config].to_hash.to_yaml
    owner node[:elephant][:username]
    group node[:elephant][:group]
  end
end

node[:elephant][:ruby][:gems].each do |gem|
  gem_package gem[:name] do
    version gem[:version]
  end
end
