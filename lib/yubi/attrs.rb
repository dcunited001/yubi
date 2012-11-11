require 'yubi' #unless defined?
require 'active_support/core_ext/class/attribute.rb' #unless_defined?

module Yubi::Attrs; end

# to setup a class attr with a default
module Yubi::Attrs::Cattr
  def cattr(sym, opts = {})
    self.class_eval <<EOS
      class_attribute(sym)
EOS
  end

  def cattr_with_default(sym, val, opts = {})
    self.class_eval do
      class_attribute(sym)
      send("#{sym.to_s}=", val)
    end
  end

  def cattr_from_block(sym, init, opts = {}, &block)
    self.class_eval do
      class_attribute(sym)
      init.instance_eval(&block)
      send("#{sym.to_s}=", init)
    end
  end 
end