directory node[:elephant][:ssl][:path] do
  recursive true
end

node[:elephant][:ssl][:certificates].each do |certificate|
  [:key, :crt].each do |type|
    file ::File.join(node[:elephant][:ssl][:path], "#{certificate[:name]}.#{type}") do
      content certificate[type]
    end
  end
end
