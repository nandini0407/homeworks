class Map

  def initialize
    @map = Array.new
  end

  def assign(key, value)
    if @map.any? { |pair| pair[0] == key }
      pair[1] = value
    else
      @map << [key, value]
    end
  end

  def lookup(key)
    @map.each do |pair|
      return pair[1] if pair[0] == key
    end
    nil
  end

  def remove(key)
    @map.each do |pair|
      @map.delete(pair) if pair[0] == key
    end
  end

  def show
    @map
  end

end
