class Stack  
  def initialize
    @store = Array.new
  end

  def push(element)
    @store << element
  end

  def pop
    @store.pop
  end

  def size
    @store.length
  end

  def empty?
    size == 0
  end
end
