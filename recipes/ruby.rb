package 'chruby'
package 'ruby-build'

node[:elephant][:ruby][:rubies].each do |ruby|
  path = ::File.join node[:elephant][:ruby][:path], "ruby-#{ruby}"

  ruby_build_ruby ruby do
    prefix_path path

    case ruby
    when /.*-railsexpress/
      definition File.expand_path(File.join(__FILE__, '../../files/default/ruby/ruby_railsexpress'))
    when /.*1\.8\.7.*/
      environment 'CONFIGURE_OPTS' => '--without-tk'
    end
  end
end

if node[:recipes].include?('elephant::oh_my_zsh')
  template "#{ENV['HOME']}/.oh-my-zsh/custom/chruby.zsh" do
    source 'ruby/chruby.zsh.erb'
  end

  if node[:recipes].include?('elephant::pow')
    cookbook_file "#{ENV['HOME']}/.powconfig" do
      source 'ruby/powconfig'
    end
  end
end

%w[gemrc irbrc].each do |file|
  cookbook_file "#{ENV['HOME']}/.#{file}" do
    source "ruby/#{file}"
  end
end
