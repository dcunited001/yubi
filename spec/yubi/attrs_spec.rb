require 'spec_helper'
require 'yubi/attrs' 

class Foo
  extend Yubi::Attrs::Cattr
  cattr_with_default :vendor_id, 321
end

describe Yubi::Attrs::Cattr do
  it 'defines a class_attribute and inits to default' do
    Foo.must_respond_to(:vendor_id)
    Foo.vendor_id.must_equal 321
  end

  it 'defines an accessor for instances' do
    foo = Foo.new
    foo.must_respond_to :vendor_id
    foo.vendor_id.must_equal 321
  end
end