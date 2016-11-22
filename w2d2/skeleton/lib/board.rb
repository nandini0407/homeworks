class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @name1 = name1
    @name2 = name2
    @cups = place_stones
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
    cups = []
    14.times do |i|
      if i == 6 || i == 13
        cup = []
      else
        cup = [:stone, :stone, :stone, :stone]
      end
      cups << cup
    end
    cups
  end

  def valid_move?(start_pos)
    raise "Invalid starting cup" unless start_pos.between?(1, 12)
  end

  def make_move(start_pos, current_player_name)
    number_of_stones = @cups[start_pos].length
    stones = Array.new(number_of_stones, :stone)
    @cups[start_pos] = []
    start = start_pos
    until stones.empty?
      start += 1
      start = 0 if start > 13
      if start == 6
        @cups[start] << stones.pop if current_player_name == @name1
      elsif start == 13
        @cups[start] << stones.pop if current_player_name == @name2
      else
        @cups[start] << stones.pop
      end
    end
    render
    next_turn(start)
  end

  def next_turn(ending_cup_idx)
    # helper method to determine what #make_move returns
    if ending_cup_idx == 6 || ending_cup_idx == 13
      :prompt
    elsif @cups[ending_cup_idx].length == 1
      :switch
    else
      ending_cup_idx
    end
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    one = @cups[0..5].all? { |cup| cup.empty? }
    two = @cups[7..12].all? { |cup| cup.empty? }
    return false unless one || two
    true
  end

  def winner
    comp = @cups[6].length <=> @cups[13].length
    if comp == -1
      return @name2
    elsif comp == 0
      return :draw
    elsif comp == 1
      return @name1
    end
  end
end
