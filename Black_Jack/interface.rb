require_relative 'casino'
class Interface
  include Casino
  attr_accessor :user, :diller, :deck, :bank_games

  def initialize
    @bank_games = 0
  end

  def start
    puts "Welcome to Black Jack game!!"
    puts "============================"
    create_object
    start_game
  end

  def create_object
    create_deck
    create_user
    create_diller
  end

  def create_deck
    @deck = Deck.new()

  rescue StandardError => e
    e.inspect
    false
  end

  def create_user
    puts "Введите Ваше имя"
    name = gets.chomp
    @user = User.new(name)
  rescue StandardError => e
    puts e.inspect
  end

  def create_diller
    @diller = Diller.new
  rescue StandardError => e
    e.inspect
    false
  end

  def start_game
    reset_value
    start_user
    start_diller
    place_bet(10)
    show_menu
  end

  def start_user
    element = []
    element << @deck.give_first_cards
    @user.cards << element[0][0] << element[0][1]
    @user.add_points(element[0][2])
    puts "#{@user.name}, Вы получили 2 карты #{@user.cards}"
    puts "Набрано очков #{@user.points}"
  end

  def start_diller
    element = []
    element << @deck.give_first_cards
    @diller.cards << element[0][0] << element[0][1]
    @diller.add_points(element[0][2])
    puts "Диллер получил 2 карты * и * "
  end

  def place_bet(bet)
    @user.sub_bank(bet)
    @diller.sub_bank(bet)
    @bank_games = bet * 2
  end

  def reset_value
    @user.cards_clear
    @diller.cards_clear
    @user.points = 0
    @diller.points = 0
  end


end
