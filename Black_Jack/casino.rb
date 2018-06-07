module Casino
  def show_menu
    loop do
      puts "=================="
      puts "Что вы хотите сделать?"
      puts "1. Пропустить ход"
      puts "2. Добавить карту"
      puts "3. Открыть карты"
      number = gets.to_i
      case number
      when 1
        diller_step
      when 2
        add_card
      when 3
        open_card
      else
        puts "Выберите число согласно списка!"
      end
    end
  end

  def add_card #если 3 карты
    element = []
    element << @deck.give_card
    @user.cards << element[0][1]
    if element[0][1].include?("T") && (@user.points + element[0][0]) > 21
      @user.add_points(1)
    else
      @user.add_points(element[0][0])
    end
    puts "#{@user.name}, Вы получили 1 карту \"#{element[0][1]}\""
    puts "Набрано очков #{@user.points}"
  end

  def open_card
    print "Ваши карты #{@user.cards}\n"
    print "Карты диллера #{@diller.cards}\n"
    if @user.points == @diller.points
      puts "Ничья"
      @user.bank += @bank_games / 2
      @diller.bank += @bank_games / 2
      @bank_games = 0
      puts "У Вас на счету #{@user.bank} $"
    elsif @user.points > 21 || @user.points < @diller.points
      puts "Вы проиграли"
      @diller.bank += @bank_games
      @bank_games = 0
      puts "У Вас на счету #{@user.bank} $"
    elsif @diller.points > 21 || @user.points > @diller.points
      puts "Вы выиграли"
      @user.bank += @bank_games
      @bank_games = 0
      puts "У Вас на счету #{@user.bank} $"
    end
    next_game
  end

  def diller_step #если 3 карты или 17 очков и более

  end


  def next_game
    loop do
      puts "====================="
      puts "Вы хотите продолжить?"
      puts "1. Yes."
      puts "2. No."
      num = gets.to_i
      case num
      when 1
        start_game
      when 2
        exit
      else
        puts "Введите 1 или 2"
      end
    end
  end

end
