require_relative "node"
class LinkedList
  attr_accessor :size

  def initialize
    @head = nil
    @tail = nil
    @size = 0
  end

  def head
    if @head.nil?
      nil
    else
      @head.value
    end
  end

  def tail
    if @tail.nil?
      nil
    else
      @tail.value
    end
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

  def pop
    if size > 1
      node = @head
      (size - 2).times { node = node.next_node }
      node.next_node = nil
      @tail = node
    elsif size == 1
      @head = nil
      @tail = nil
    else
      puts "List empty, nothing popped"
    end
    @size -= 1
  end

  def contain?(val)
    node = @head

    until node.nil?
      return true if node.value == val

      node = node.next_node
    end
    false
  end

  def find(val)
    node = @head
    ind = 0

    until node.nil?
      return ind if node.value == val

      node = node.next_node
      ind += 1
    end
    nil
  end

  def to_s
    node = @head
    string = ''

    until node.nil?
      string << "( #{node.value} ) -> "
      node = node.next_node
    end
    "#{string}nil"
  end

  def insert_at(value, index)
    index = size if index >= size
    insert_node = Node.new
    node = @head
    @size += 1
    insert_node.value = value
    (index - 1).times { node = node.next_node }
    insert_node.next_node = node.next_node
    node.next_node = insert_node
  end

  def shift
    return if @head.nil?

    del_node = @head
    @head = @head.next_node
    @tail = nil if @head.nil?
    del_node.next_node = nil
    @size -= 1
  end

  def remove_at(index)
    return shift if index <= 0

    return pop if index >= size

    pre_node = @head
    (index - 1).times { pre_node = pre_node.next_node }
    del_node = pre_node.next_node
    pre_node.next_node = del_node.next_node
    del_node.next_node = nil
    @size -= 1
  end
end
