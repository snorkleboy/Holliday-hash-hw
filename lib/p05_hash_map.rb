require_relative 'p02_hashing'
require_relative 'p04_linked_list'

class HashMap

  include Enumerable
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { LinkedList.new }
    @count = 0
  end

  def include?(key)
    @store[key.hash%num_buckets].include?(key)
  end

  def set(key, val)
    if include?(key)
      @store[key.hash%num_buckets].update(key,val)
    else
      @store[key.hash%num_buckets].append(key, val)
      @count += 1
      if (@count == num_buckets)
        resize!
      end
    end
  end

  def get(key)
    @store[key.hash%num_buckets].get(key)
  end

  def delete(key)
  end

  def each
    @store.each{|list| list.each{|item| yield item}}
  end

  # uncomment when you have Enumerable included
  # def to_s
  #   pairs = inject([]) do |strs, (k, v)|
  #     strs << "#{k.to_s} => #{v.to_s}"
  #   end
  #   "{\n" + pairs.join(",\n") + "\n}"
  # end

  alias_method :[], :get
  alias_method :[]=, :set

  private

  def num_buckets
    @store.length
  end

  def resize! 
    temp = @store
    @count = 0
     
    @store = Array.new(@store.length*2) { LinkedList.new }
    temp.each_with_index{|list| list.each{|item| set(item.key, item.val) } }
  end

  def bucket(key)
    # optional but useful; return the bucket corresponding to `key`
  end
end
