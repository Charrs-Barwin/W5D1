class Integer
  # Integer#hash already implemented for you
end

class Array
  def hash
    str = ''
    self.each_with_index do |e,i|
      str += e.to_s.to_i.hash.to_s + i.hash.to_s
    end
    str.to_i.hash + self.count
  end
end

class String
  def hash
    self.chars.hash
  end
end

class Hash
  def hash
    (self.keys + self.values).hash
  end
end
