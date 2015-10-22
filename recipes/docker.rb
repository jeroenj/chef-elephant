packages = %w(docker docker-compose docker-machine)

packages.each do |package_name|
  package package_name
end
