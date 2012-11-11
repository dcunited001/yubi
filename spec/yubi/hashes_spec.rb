require 'spec_helper'
require 'yaml' #unless defined?
require 'yubi/hashes'

class FooHash 
  extend Yubi::Hashes::NestedSymbolizeKeys
end

describe Yubi::Hashes do
  describe Yubi::Hashes::NestedSymbolizeKeys do
    let(:yaml_file) { 'nested_symbolize_keys' }
    let(:yaml_data) { YAML::load_file(yaml_path(yaml_file)) }

    it 'symbolize all the keys' do
      hsh = FooHash.nested_symbolize_keys(yaml_data)
      hsh.keys.must_include :val1, :val2
      hsh.keys.must_include :group1, :group2
      hsh[:group1].keys.must_include :val1
      hsh[:group1].keys.must_include :val2
    end
  end
end