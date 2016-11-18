class Queue

  def initialize
    @array = []
  end

  def enqueue(el)
    @array.push(el)
  end

  def deque
    @array.shift
  end

  def show
    @array
  end

end
