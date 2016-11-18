class Stack
  def initialize
    # create ivar to store stack here!
    @array = Array.new
  end

  def add(el)
    # adds an element to the stack
    @array.push(el)
  end

  def remove
    # removes one element from the stack
    @array.pop
  end

  def show
    # return a copy of the stack
    @array
  end
end
