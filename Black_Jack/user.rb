class User
  NAME = /\A[A-Z]{0,8}\Z/i
  attr_accessor :name, :bank, :cards, :points
  def initialize(name)
    @name = name.capitalize
    validate!
    @bank = 100
    @cards = []
    @points = 0
  end

  def sub_bank(bet)
    @bank -= bet
  end

  def add_points(num)
    @points += num
  end

  def cards_clear
    @cards.clear
  end

  def validate!
    raise "Не соответствует формату!" if @name !~ NAME
  end

end
