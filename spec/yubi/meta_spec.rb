require 'spec_helper'
require 'yubi/meta'

describe Yubi::Meta::Classes do
  let(:this) { Yubi::Meta::Classes }
  let(:name) { "newclass" }
  let(:sc) { :superclass }
  describe "#new_class" do
    it 'creates a new class' do
      this.expects(:get_class).with(sc).returns(sc)
      Object.expects(:const_set).with(name.capitalize, sc)
      this.new_class(name, sc)
    end
    it 'defaults to setting the superclass to Object' do
      this.expects(:get_class).with(nil).returns(nil)
      Object.expects(:const_set).with(name.capitalize, Object)
      this.new_class(name)
    end
  end
  describe "get_class" do
    it 'returns nil with nil input' do
      this.get_class(nil).must_be_nil
    end 
    it 'returns a class when given a class' do
      this.get_class(String).must_equal String
    end
    it 'returns nil when no class found' do
      skip
      this.get_class(Fdsa).must_equal nil
    end
  end
end