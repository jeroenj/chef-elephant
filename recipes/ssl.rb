elephant_recursive_directory node[:elephant][:ssl][:path] do
  owner node[:elephant][:username]
  group node[:elephant][:group]
end

node[:elephant][:ssl][:certificates].each do |certificate|
  [:key, :crt].each do |type|
    file ::File.join(node[:elephant][:ssl][:path], "#{certificate[:name]}.#{type}") do
      content certificate[type]
      owner node[:elephant][:username]
      group node[:elephant][:group]
    end
  end
end
