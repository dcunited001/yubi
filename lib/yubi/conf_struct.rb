require 'ostruct'
require 'yubi'
require 'yubi/attrs'
require 'yubi/hashes'

module Yubi::ConfStruct
  def self.included(base)
    base.extend ::Yubi::Hashes::NestedSymbolizeKeys
  end
  def new_ostruct_member(name)
    name = name.to_sym
    unless self.respond_to?(name)
      class_eval <<EOS
        def #{name.to_s}
          v = @table[:#{name.to_s}]
          if v.is_a?(Hash)
            self.class.new(v)
          else
            v
          end
        end
        def #{name.to_s}=(x)
          modifiable[:#{name.to_s}] = x
        end
EOS
    end
    name
  end

  def method_missing(mid, *args, &block)
    mname = mid.id2name
    len = args.length
    if mname.chomp!('=') && (mid != :[]=)
      if len != 1
        raise ArgumentError, "wrong number of arguments (#{len} for 1)", caller(1)
      end
      modifiable[new_ostruct_member(mname)] = args[0]
    elsif len == 0 && (mid != :[])
      if block_given?
        cs = self.class.new(Hash.new).ostruct_eval(&block)
        modifiable[new_ostruct_member(mname)] = cs
      else 
        @table[mid]
      end
    elsif len == 1 && (mid != :[])
      modifiable[new_ostruct_member(mname)] = args[0]
    else
      raise NoMethodError, "undefined method `#{mid}' for #{self}", caller(1)
    end
  end

  def [](key)
    @table[key]
  end

  def []=(key,val)
    modifiable[key] = val
  end

  def ostruct_eval(&block)
    instance_eval(&block)
    self
  end
end

