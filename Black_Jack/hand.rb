module Hand
  def show_menu
    loop do
      open_card if number_cards
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
        if @user.cards.size <= 2
          add_card
        else
          puts "У Вас 3 карты! Хотите открыть?"
        end
      when 3
        open_card
      else
        puts "Выберите число согласно списка!"
      end
    end
  end

  def add_card
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
    open_card if number_cards
    diller_step
  end

  def open_card
    print "Ваши карты #{@user.cards}, набрано #{@user.points} \n"
    print "Карты диллера #{@diller.cards}, набрано #{@diller.points} \n"
    if @user.points == @diller.points || (@user.points > 21 && @diller.points >21)
      puts "Ничья!"
      @user.bank += @bank_games / 2
      @diller.bank += @bank_games / 2
      @bank_games = 0
      puts "У Вас на счету #{@user.bank} $"
    elsif @user.points > 21 || (@user.points < @diller.points && @diller.points <=21)
      puts "Вы проиграли!"
      @diller.bank += @bank_games
      @bank_games = 0
      puts "У Вас на счету #{@user.bank} $"
    elsif @diller.points > 21 || @user.points > @diller.points
      puts "Вы выиграли!"
      @user.bank += @bank_games
      @bank_games = 0
      puts "У Вас на счету #{@user.bank} $"
    end
    next_game
  end

  def diller_step
    if @diller.cards.size == 3 || @diller.points >= 17
      puts "Диллер пропустил ход!"
      show_menu
    else
      element = []
      element << @deck.give_card
      @diller.cards << element[0][1]
      if element[0][1].include?("T") && (@diller.points + element[0][0]) > 21
        @diller.add_points(1)
      else
        @diller.add_points(element[0][0])
      end
      puts "#{@diller.name}, получил 1 карту \"*\""
    end
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

  def number_cards
    if @user.cards.size == 3 && @diller.cards.size == 3
      true
    else
      false
    end
  end

end
