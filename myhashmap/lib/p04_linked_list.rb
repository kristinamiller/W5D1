

class Node
  include Enumerable
  attr_reader :key
  attr_accessor :val, :next, :prev

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
    # optional but useful, connects previous link to next link
    # and removes self from list.
  end
end

class LinkedList
  include Enumerable
  def initialize
    @head = Node.new
    @tail = Node.new
    @head.next = @tail
    @tail.prev = @head
  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
    @head.next
  end

  def last
    @tail.prev
  end

  def empty?
    @head.next == @tail
  end

  def get(key)
    node = first
    until node.key == key
      return nil if node == @tail
      node = node.next
    end
    node.val
  end

  def include?(key)
  end

  def append(key, val)
    node = Node.new(key, val)
    prev_node = @tail.prev
    node.next = @tail
    node.prev = prev_node 
    prev_node.next = node
    @tail.prev = node
  end

  def update(key, val)
    node = first
    until node.key == key
      return true if node == @tail
      node = node.next
    end
    node.val = val
  end

  def remove(key)
    node = first
    until node.key == key
      return nil if node == @tail
      node = node.next
    end
    next_node = node.next
    prev_node = node.prev
    next_node.prev = prev_node
    prev_node.next = next_node
  end

  def each(&prc)
    node = first
    until node == @tail
      prc.call(node)
      node = node.next
    end
  end

  # uncomment when you have `each` working and `Enumerable` included
  # def to_s
  #   inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  # end
end
