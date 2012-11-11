require 'yubi' #unless defined?

module Yubi::Hashes; end

# extend for a class method to recursively symbolize keys of hash
module Yubi::Hashes::NestedSymbolizeKeys
  def nested_symbolize_keys(hash)
    hash.inject({}) do |result, (key, value)|
      new_key = case key
        when String then key.to_sym
        else key
        end
      new_value = case value
        when Hash then nested_symbolize_keys(value)
        else value
        end
      result[new_key] = new_value
      result
    end
  end
end