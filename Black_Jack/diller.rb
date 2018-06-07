class Diller
  attr_accessor :name, :bank, :cards,  :points
  def initialize()
    @name = "Diller"
    @bank = 100
    @cards = []
    @points = 0
  end

  def add_points(num)
    @points += num
  end

  def cards_clear
    @cards.clear
  end

  def sub_bank(bet)
    @bank -= bet
  end

end
