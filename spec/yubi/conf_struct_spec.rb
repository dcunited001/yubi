require 'spec_helper'
require 'yubi/conf_struct' 

class FooStruct < OpenStruct
  include Yubi::ConfStruct
end

class FooClass
  extend Yubi::Attrs::Cattr
  cattr_from_block(:simple, FooStruct.new) do
    val1 1
    val2 2
    val3 3
  end
  cattr_from_block(:blk, FooStruct.new) do
    val1 1
    val2 2
    group1 do
      val1 11
      val2 12
    end
    group2 do
      val1 21
      val2 22
      group3 do
        val1 231
        val2 232
      end
    end
  end
end

yaml_file = 'nested_symbolize_keys'
yaml_data = YAML::load_file(yaml_path(yaml_file)) 
yaml_data = FooStruct.nested_symbolize_keys(yaml_data)

describe Yubi::ConfStruct do
  let(:fs) { FooStruct.new(yaml_data) }
  it 'can dynamically define missing methods' do
    fs.val1.must_equal 1
    fs.val2.must_equal 2
    fs.group1.val1.must_equal 11
    fs.group2.val2.must_equal 22
  end
  it 'can be nested when block received'
  it 'only writes to @table when modifiable' do
    h = {val1: 1}
    fs.expects(:modifiable).returns(h)
    fs.val1 = 'val2'
  end
  it 'updates #respond_to?' do
    #update respond_to? or respond_to_missing?
    skip
  end
end

describe FooClass do
  it 'should work given a block with simple attributes' do
    FooClass.simple.val1.must_equal 1
    FooClass.simple[:val2].must_equal 2
    FooClass.simple.val3.must_equal 3
  end
  it 'should have set up attributes from the block for #blk' do
    FooClass.blk.val1.must_equal 1
    FooClass.blk[:val2].must_equal 2
    FooClass.blk.group1.val1.must_equal 11
    FooClass.blk.group1.must_respond_to :val1
    FooClass.blk.group2.group3.val1.must_equal 231
  end
end
