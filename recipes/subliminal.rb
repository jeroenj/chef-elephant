include_recipe 'elephant::python'

execute 'Install subliminal' do
  command 'pip install subliminal'
  not_if { `pip show subliminal` =~ /subliminal/ }
end
