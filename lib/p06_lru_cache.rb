require_relative 'p05_hash_map'
require_relative 'p04_linked_list'

class LRUCache
  attr_reader :count
  def initialize(max, prc)
    @map = HashMap.new
    @store = []
    @max = max
    @prc = prc
  end

  def count
    @map.count
  end

  def get(key)
  end

  def to_s
    "Map: " + @map.to_s + "\n" + "Store: " + @store.to_s
  end

  private

  def calc!(key)
    # suggested helper method; insert an (un-cached) key
    p 'start'
    if(@map.include?(key))
      p 'here'
      return @store.get[key]
    else
      val = prc(key)
      @store.push(key:val)
      p @store
      return val
    end
    
  end

  def update_node!(node)
    # suggested helper method; move a node to the end of the list
  end

  def eject!
    @store.pop
  end
end
