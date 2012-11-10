# encoding: utf-8
$LOAD_PATH.unshift(File.dirname(__FILE__))
gem "minitest"

require "minitest/spec"
require "minitest/autorun"
require "minitest/matchers"
require "minitest/pride"
require "mocha"
require "pry"

def this
  Yubi
end

def yaml_path(name)
  File.join('fixtures','yaml',"#{name}.yaml")
end

def bin_path(name)
  File.join('fixtures','yaml',"#{name}.bin")
end