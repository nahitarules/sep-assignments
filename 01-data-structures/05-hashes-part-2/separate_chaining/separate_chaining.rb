require_relative 'linked_list'
require_relative 'node'

class SeparateChaining
  attr_reader :max_load_factor

  def initialize(size)
    @max_load_factor = 0.7
    @count = 0
    @items = Array.new(size)
  end

  def []=(key, value)

    i = index(key, size())
    n = Node.new(key, value)
    # COLLISION!
    @items[i] != nil ? list = @items[i] : list = LinkedList.new

    list.add_to_tail(n)
    @items[i] = list
    @count += 1
    if load_factor >= @max_load_factor.to_f
      resize()
    end
  end

  def [](key)
    i = index(key, size())
    if @items[i] != nil
      curr = @items[i].head
      while curr != nil
        if curr.key == key
          return curr.value
        end
        curr = curr.next
      end
    end
  end

  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use the ascii value of each string as
  # a starting point.
  def index(key, size)
    key.sum % size
  end

  # Calculate the current load factor
  def load_factor
    size = size().to_f
    lf = @count / size
    return lf
  end

  # Simple method to return the number of items in the hash
  def size
    @items.size
  end

  # Resize the hash
  def resize
    resized = size*2
    new_items = Array.new(resized)
    (0..@items.size-1).each do |i|
      list = @items[i]
      if list != nil
        curr = list.head
        new_index = index(curr.key, new_items.size)
        while curr != nil
          llist = LinkedList.new
          llist.add_to_tail(curr)
          new_items[new_index] = llist
          curr = curr.next
        end
      end
    end

    @items = new_items
  end

  def print_hash
    @items.each do |i|
      if i != nil
        curr = i.head
        while curr != nil
          puts "Key: #{curr.key}, Value: #{curr.value}"
          curr = curr.next
        end
      end
    end 
  end
end
