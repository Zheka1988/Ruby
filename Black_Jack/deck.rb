class Deck
  attr_accessor :taken_kards
  attr_reader :full_deck

  def initialize
    @full_deck = {
      "T+" => 11, "T<З" => 11, "T^" => 11, "T<>" => 11,
      "K+" => 10, "K<З" => 10, "K^" => 10, "K<>" => 10,
      "D+" => 10, "D<З" => 10, "D^" => 10, "D<>" => 10,
      "B+" => 10, "B<З" => 10, "B^" => 10, "B<>" => 10,

      "10+" => 10, "10<З" => 10, "10^" => 10, "10<>" => 10,
      "9+" => 9, "9<З" => 9, "9^" => 9, "9<>" => 9,
      "8+" => 8, "8<З" => 8, "8^" => 8, "8<>" => 8,
      "7+" => 7, "7<З" => 7, "7^" => 7, "7<>" => 7,
      "6+" => 6, "6<З" => 6, "6^" => 6, "6<>" => 6,
      "5+" => 5, "5<З" => 5, "5^" => 5, "5<>" => 5,
      "4+" => 4, "4<З" => 4, "4^" => 4, "4<>" => 4,
      "3+" => 3, "3<З" => 3, "3^" => 3, "3<>" => 3,
      "2+" => 2, "2<З" => 2, "2^" => 2, "2<>" => 2
    }
  end

  def give_first_cards
    i = 0
    key = ''
    points = 0
    rezult = []
    loop do
      keys = @full_deck.keys
      key = keys[rand(keys.size)]
      points += @full_deck[key]
      @full_deck.delete(key)
      rezult << key
      i += 1
    break if i == 2
    end
    rezult << points
  end

  def give_card
    key = ''
    rezult = []
    keys = @full_deck.keys
    key = keys[rand(keys.size)]
    rezult << @full_deck[key]
    @full_deck.delete(key)
    rezult << key

  end

end
