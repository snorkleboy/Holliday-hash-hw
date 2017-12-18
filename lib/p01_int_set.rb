class MaxIntSet
  def initialize(max)
    @max = max
    @store=[]
  end

  def insert(num)
      raise "Out of bounds" unless (num < @max && num>0)
      @store[num]=true

  end

  def remove(num)
     @store[num]=false
  end

  def include?(num)
    @store[num]
  end

  private

  def is_valid?(num)

  end

  def validate!(num)
  end
end


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    @store[num%20][0]=true
  end

  def remove(num)
    @store[num%20][0]=false
  end

  def include?(num)
    @store[num%20][0] 
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    @store[num%20][0] = true
    @count = count + 1
    if (@count == num_buckets) 
      resize! 
    end

  end

  def remove(num)
    @store[num%20][0]=false
    @count = @count - 1
  end

  def include?(num)
    @store[num%20][0] 
  end
  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize! 
    temp = @store
    @count = 0
     
    @store = Array.new(@store.length*2) { Array.new }
    temp.each_with_index{|item, index| item[0]? self.insert(index) : false}
  end
end
