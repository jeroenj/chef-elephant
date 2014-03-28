package 'python'

node[:elephant][:python][:pip][:packages].each do |pkg|
  elephant_pip pkg
end
