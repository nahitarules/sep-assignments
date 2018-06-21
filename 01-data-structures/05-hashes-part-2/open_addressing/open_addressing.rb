require_relative 'node'

class OpenAddressing
  def initialize(size)
    @items = Array.new(size)
    
  end

  def []=(key, value)
    i = index(key, size())
    new_item = @items[i]
    if new_item.nil?
      @items[i] = Node.new(key, value)
    elsif new_item.key != key
      while @items[index(key, size())].key != nil && @items[index(key, size())].key != key
        resize()
        second_index = index(key, size())
        break if @items[second_index] == nil
      end
      self[key] = value
    elsif new_item.key == key && new_item.value != value
      if next_open_index(i) == -1
        resize()
        second_index = index(key, size())
        @items[second_index].value = value
      else
        new_index = next_open_index(i)
        @items[new_index] = Node.new(key,value)
      end
    end
  end

  def [](key)
    i = index(key, size())
    @items[i].value
  end

  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use the ascii value of each string as
  # a starting point.
  def index(key, size)
    key.sum % size
  end

  # Given an index, find the next open index in @items
  def next_open_index(index)
    while @items[index]
      index += 1
    end
    if index >= self.size
      return -1
    else
      return index
    end
  end

  # Simple method to return the number of items in the hash
  def size
    @items.length
  end

  # Resize the hash
  def resize
    @size = @items.length * 2
    resized_hash = Array.new(@size)
    @items.each do |item|
     if item != nil
       resized_hash[index(item.key, @size)] = item
     end
   end
   @items = resized_hash
  end
end
