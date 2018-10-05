module DeepFreezable
  def deep_freeze(array_or_hash)
    case array_or_hash
    when Array
      array_or_hash.each do |element|
        element.freeze
      end
    when Hash
      array_or_hash.each do |key, value|
        key.freeze
        value.freeze
      end
    else
      p 'args is not array or hash'
    end

    array_or_hash.freeze
  end
end

class Team
  extend DeepFreezable

  COUNTRIES = deep_freeze(['Japan', 'US', 'India'])
end

class Bank
  extend DeepFreezable

  CURRENCIES = deep_freeze({japan: 'yen', us: 'dollar', india: 'rupee'})
end

