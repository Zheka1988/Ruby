require_relative 'methods_players'
class User
  include MethodsPlayers
  NAME = /\A[A-Z]{0,8}\Z/i
  def initialize(name)
    @name = name.capitalize
    validate!
    @bank = 100
    @cards = []
    @points = 0
  end

  def validate!
    raise "Не соответствует формату!" if @name !~ NAME
  end
end
