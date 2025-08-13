require_relative "node"
class LinkedList
  attr_accessor :size

  def initialize
    @head = nil
    @tail = nil
    @size = 0
  end

  def head
    @head.value
  end

  def tail
    @tail.value
  end

  def append(val)
    n = Node.new
    @size += 1
    n.value = val
    n.next_node = nil
    if @tail.nil?
      @tail = n
      @head = n
    else
      @tail.next_node = n
      @tail = n
    end
  end

  def prepend(val)
    if @head.nil?
      append(val)
    else
      n = Node.new
      @size += 1
      n.value = val
      n.next_node = @head
      @head = n
    end
  end

  def at(index)
    if !(-size..size-1).include?(index)
      puts "index doesn't exist"
    elsif index < 0
      at(size + index)
    else
      node = @head
      i = 0
      while i < index
        node = node.next_node
        i += 1
      end
      node.value
    end
  end
end
