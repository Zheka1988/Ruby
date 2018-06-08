require_relative 'methods_players'
class Diller
  include MethodsPlayers
  def initialize()
    @name = "Diller"
    @bank = 100
    @cards = []
    @points = 0
  end

end
