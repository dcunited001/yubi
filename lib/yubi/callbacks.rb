require 'yubi'
require 'hooks'

module Yubi::Callbacks; end

# add callbacks on method_missing
module Yubi::Callbacks::MethodMissing; end

# base class with init callbacks
class Yubi::Callbacks::InitBase
  def initialize(*args)
    run_hook(:before_init, *args)
    #init
    run_hook(:after_init, *args)
  end

  include Hooks
  define_hook :before_init, :after_init
  before_init :set_opts
  before_init :set_foo
  after_init :set_bar

  attr_accessor :foo, :bar, :opts

  def set_opts(*args)
    @opts = (args && (args.last.is_a? Hash)) ? args.pop : {}
  end
  def set_foo(*args)
    @foo = args.count
  end
  def set_bar(*args)
    @bar = args.shift
  end
end

# ran into issues overriding initialize using a module
#   providing init base class for now
#   possibly use eigenclass later?
# module Yubi::Callbacks::Init
#   def self.included(base)
#     base.instance_eval <<EOEVAL
#       include ::Hooks unless base.include? ::Hooks
#       define_hook :during_init, :after_init
# EOEVAL
#   end
#   def initialize(*args)
#     run_hook(:before_init, *args)
#     super #??
#     run_hook(:after_init, *args)
#   end
# end