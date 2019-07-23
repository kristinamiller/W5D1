class Integer
  # Integer#hash already implemented for you
end

class Array
  def hash
    hash_num = 0
    self.each_with_index do |el, idx|
      if el.kind_of?(Integer) 
        hash_num += el.hash * 2 ** (idx + 1) 
      else 
        hash_num += el.hash * 2 ** (idx + 1) 
      end
    end
    hash_num
  end
end

class String
  def hash
    hash_num = 0
    self.each_char.with_index do |char, idx|
      hash_num += char.ord.hash * (2 ** idx )
    end
    hash_num
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    0
  end
end
