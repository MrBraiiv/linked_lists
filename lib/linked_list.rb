require_relative "node"
class LinkedList
  attr_accessor :head, :tail

  def initialize
    @head = nil
    @tail = nil
  end

  def append(val)
    n = Node.new
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
      n.value = val
      n.next_node = @head
      @head = n
    end
  end
end
