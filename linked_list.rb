class LinkedList
  attr_accessor :head, :tail, :size
  
  def initialize
    @head = nil
    @tail = nil
    @size = 0
  end
  
  def append(node)
    if @head.nil?
      @head = node
    else
      @tail.next_node = node
    end
      @tail = node
      node.next_node = nil
    
    @size += 1
  end
  
  def prepend(node)
    if @head.nil?
      @head = node
      @tail = node
      node.next_node = nil
    else
      node.next_node = @head
      @head = node
    end
      
    @size += 1
  end
  
  def size
    puts @size
  end
  
  def head
    puts @head.value
  end
  
  def tail
    puts @tail.value
  end
  
  def at(index)
    return nil if index >= @size
    current = @head
    
    index.times do
      current = current.next_node
    end
    
    puts current.value
  end
  
  def pop
    if !@head.nil?
      @tail = at(@size - 2)
      @tail.next_node = nil
      @size -= 1
    end
  end
  
  def contains?(value)
    current = @head
    
    @size.times do
      return true if current.value == value
      current = current.next_node
    end
    
    return false
  end
  
  def find(data)
    index = 0
    current = @head
    
    @size.times do
      return index if current.value == data
      current = current.next_node
      index += 1
    end
    
    return nil
  end
  
  def to_s
    current = @head
    
    @size.times do
      print "(#{current.value}) -> "
      current = current.next_node
    end
    
    puts "nil"
  end
  
  def insert_at(node, index)
    if index == 0
      puts "Use .prepend() method instead if adding a value to the beginning of the list"
      return
    end
    
    current = @head
    (index - 1).times {current = current.next_node}
    node.next_node = current.next_node
    current.next_node = node
    @size += 1
  end
  
  def remove_at(index)
    if index > @size - 1
      puts "There are only #{@size} nodes in the list"
      return
    elsif index == 0
      @head = @head.next_node
    else
      current = @head
      (index - 1).times { current = current.next_node }
      current.next_node = current.next_node.next_node
    end
    
    @size -= 1
  end
end

class Node
  attr_accessor :value, :next_node
  
  def initialize(value = nil, next_node = nil)
    @value = value
    @next_node = next_node
  end
end

list = LinkedList.new
node1 = Node.new(1)
node2 = Node.new(2)
node3 = Node.new(3)
node4 = Node.new(4)
list.append(node1)
list.append(node2)
list.prepend(node3)
list.remove_at(2)
list.to_s
list.size



