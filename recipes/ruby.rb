%w[gemrc].each do |file|
  cookbook_file "#{ENV['HOME']}/.#{file}" do
    source "ruby/#{file}"
    owner node['elephant']['user']
  end
end
