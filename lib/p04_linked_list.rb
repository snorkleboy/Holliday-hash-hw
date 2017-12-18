class Node
  
  attr_accessor :key, :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end

  def remove
    # optional but useful, connects previous node to next node
    # and removes self from list.
  end
end

class LinkedList
  include Enumerable
  def initialize
    @head = false
    @tail = false
    @length = 0
  end

  def [](i)
    each_with_index { |node, j| return node if i == j }
    nil
  end

  def first
    @head
  end

  def last
    @tail
  end

  def empty?
    !@head
  end
  def getN(key)
      if (@length>0)
            currentNode = @head
            for i in 0...@length
              if (currentNode.key == key)
                return currentNode
              else
                currentNode = currentNode.next
              end
            end
      end
      nil    
  end
  def get(key)
      if (@length>0)
            currentNode = @head
            for i in 0...@length
              if (currentNode.key == key)
                return currentNode.val
              else
                currentNode = currentNode.next
              end
            end
      end
      nil    
  end

  def include?(key)
    !!getN(key)
  end

  def append(key, val)
    if (@length>0)
      newNode = Node.new(key,val)
      newNode.prev = @tail
      @tail.next = newNode
      @tail = newNode
    else 
      p 'here'
      @head = Node.new(key,val)
      @tail = @head
    end
    @length = @length + 1
  end

  def update(key, val)
    node = getN(key)
    if (node)
      node.val = val
    end
  end

  def remove(key)
    if (@length>0)
      currentNode = @head
      for i in 0...@length
        if (currentNode.key == key)
          prevNode = currentNode.prev
          nextNode = currentNode.next

          prevNode.next = nextNode
          nextNode.prev = prevNode
          
          @length = @length - 1
          return
        else
          currentNode = currentNode.next
        end
      end    
    end

  end

  def each()
    currentNode = @head
    for i in 0...@length
      yield(currentNode)
      currentNode = currentNode.next
    end
  end

  # uncomment when you have `each` working and `Enumerable` included
  def to_s
    inject([]) { |acc, node| acc << "[#{node.key}, #{node.val}]" }.join(", ")
  end
end
