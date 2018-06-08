module MethodsPlayers
  attr_accessor :name, :bank, :cards, :points

  def sub_bank(bet)
    @bank -= bet
  end

  def add_points(num)
    @points += num
  end

  def cards_clear
    @cards.clear
  end
end
