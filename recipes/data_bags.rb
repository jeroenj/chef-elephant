names = ['shared', node[:elephant][:hostname].downcase]

# Code copied from ActiveSupport
# https://github.com/rails/rails/blob/master/activesupport/lib/active_support/core_ext/hash/deep_merge.rb
class ::Hash
  def deep_merge other_hash, &block
    dup.deep_merge!(other_hash, &block)
  end

  # Same as +deep_merge+, but modifies +self+.
  def deep_merge! other_hash, &block
    other_hash.each_pair do |k, v|
      tv = self[k]
      if tv.is_a?(Hash) && v.is_a?(Hash)
        self[k] = tv.deep_merge(v, &block)
      else
        self[k] = block && tv ? block.call(k, tv, v) : v
      end
    end
    self
  end
end

names.each do |name|
  data_bag(name).each do |bag|
    node.default[:elephant] = node[:elephant].deep_merge data_bag_item(name, bag).raw_data.reject { |k, _v| k == 'id' }
  end
end
