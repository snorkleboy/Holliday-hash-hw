class Fixnum
  # Fixnum#hash already implemented for you
end

class Array
  def hash
    self.empty? ? 0.hash : self.flatten.reduce{|sum,el| sum=el.to_i.hash}
  end
end

class String
  def hash
    sum = 0
    self.split('').each_with_index{|el,idx| sum += idx*el.ord}
    sum.hash
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    #what?
    0
  end
end
