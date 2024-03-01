class Node
  attr_accessor :key,:value, :next_node

  def initialize(key,value)
    @key = key
    @value = value
    @next_node = nil
  end
end

class LinkedList
  attr_accessor :head

  def initialize(head=nil)
    @head = head
  end

  # Method to add a new node to the end of the linked list
  def append(key,value)
    if @head.nil?
      @head = Node.new(key,value)
    else
      current = @head
      while current.next_node
        if key == current.key        
          break
        end
        current = current.next_node
      end
      if key == current.key
        current.value = value
      else  
      current.next_node = Node.new(key,value)
      end
    end
  end
  def remove(key)
    current = @head
    if current.key==key
      val =@head.value
      @head = @head.next_node
      return val
    end      
    while current.next_node 
      if current.next_node.key == key
        val = current.next_node.value
        current.next_node = current.next_node.next_node
        return val
      end
      current = current.next_node
    end

  end

  def find(key)
    current = @head
    while current
      if current.key == key
        return current.value
      end
      current = current.next_node
    end
    nil
  end
  # Method to display the linked list
  def display
    current = @head
    while current
      print "#{current.key},#{current.value} -> "
      current = current.next_node
    end
    puts "nil"
  end
end

# Example usage
list = LinkedList.new
list.append(1,"ji")
# list.append(2,"ii")
# list.display
# list.append(2,"nvi")
# list.display
# list.append(3,"pp")
# list.display
# list.append(3,"1")
# list.display
# list.append(3,"se")
# list.display
# p list.head.key
# p list.find(2)
p list.remove(1)
p list.find(1)
list.display