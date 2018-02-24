class Fixnum
  # Fixnum#hash already implemented for you
end

class Array
  def hash
    if self.empty?
      self.length.hash
    else
      hash_num = 0
      self.each_with_index do |int, idx|
        hash_num += (int + idx).hash
      end
      hash_num
    end
  end
end

class String
  def hash
    alpha = ('a'..'z').to_a
    int_arr = self.chars.map { |ltr| alpha.index(ltr.downcase) }
    int_arr.hash
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    hash_num = 0
    self.each do |key, value|
      hash_num += (key.hash + value.hash)
    end
    hash_num
  end
end
