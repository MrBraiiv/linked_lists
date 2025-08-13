require_relative "node"
class LinkedList
  attr_accessor :head, :tail

  def initialize
    @head = nil
    @tail = nil
  end

  def append(val)
    if tail.nil?
      @tail = Node.new
      @head = tail
    else
      @tail.next_node = Node.new
      @tail = tail.next_node
      @tail.value = val
      @tail.next_node = nil
    end
  end

  def prepend(val)
    if head.nil?
      @head = Node.new
      @tail = head
    else
      n = node.new
      n.value = val
      n.next_node = head
      @head = n
    end
  end
end
