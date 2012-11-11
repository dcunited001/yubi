require 'yubi' #unless defined?

module Yubi::Meta; end

module Yubi::Meta::Classes
  def self.new_class(name, parent = nil)
    parent = get_class(parent) || Object
    Object.const_set(name.to_s.capitalize, parent)
  end

  def self.get_class(name)
    case name
    when Class then name
    when Symbol then Object.const_find(name)
    when String then Object.const_find(name)
    end
  end
end

# use dslkit/eigenclass instead
#module Yubi::Meta::Eigen; end