require 'spec_helper'
require 'yubi/callbacks'

class SubBase < Yubi::Callbacks::InitBase; end

describe Yubi::Callbacks::InitBase do
  let(:ib) { Yubi::Callbacks::InitBase }
  let(:opts) {{ opt1: 'opt1', opt2: 'opt2' }}
  let(:args) {['a','b','c', opts]}
  let(:foo) {Yubi::Callbacks::InitBase.new(*args)}
  let(:sub) {SubBase.new(*args)}

  it 'adds the appropriate class methods from the Hook gem' do
    ib.must_respond_to :define_hook
    ib.must_respond_to :run_hook
  end
  it 'adds methods to define callbacks to run' do
    ib.must_respond_to :before_init
    ib.must_respond_to :after_init
  end
  it 'adds the define_hooks and run_hook methods from the Hook gem' do
    ib.instance_methods.must_include :run_hook
  end
  it 'runs the initialize callbacks' do
    foo.opts.must_equal opts
    foo.bar.must_equal 'a'

    skip
    test.foo.must_equal 3
  end
  it 'allows subclasses to inherit the init callbacks' do
    sub.opts.must_equal opts
    sub.bar.must_equal 'a'
  end
end

describe Yubi::Callbacks::MethodMissing do

end
