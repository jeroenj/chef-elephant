package 'chruby'
package 'ruby-build'

node[:elephant][:ruby][:rubies].each do |ruby|
  path = ::File.join node[:elephant][:ruby][:path], "ruby-#{ruby}"

  ruby_build_ruby ruby do
    definition(File.expand_path(File.join(__FILE__, "../../files/default/ruby/ruby_railsexpress"))) if ruby =~ /.*-railsexpress/
    prefix_path path
  end
end

if node[:recipes].include?('elephant::oh_my_zsh')
  template "#{ENV['HOME']}/.oh-my-zsh/custom/chruby.zsh" do
    source 'ruby/chruby.zsh.erb'
  end
end

%w[gemrc].each do |file|
  cookbook_file "#{ENV['HOME']}/.#{file}" do
    source "ruby/#{file}"
  end
end
