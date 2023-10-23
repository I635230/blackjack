class CardManager

  def initialize
    @deck = make_deck
  end

  def set_gambler_array=(gambler_array)
    @gambler_array = gambler_array
  end

  def make_deck
    deck = []
    all_symbol_array = %i[heart clover spade diamond]
    for symbol in all_symbol_array do
      ([symbol]*13).zip((1..13).to_a) do |symbol, number|
        deck.push([symbol, number])
      end
    end
    deck
  end

  # TODO: draw_a_card いらなかったら、こっちに名前を変える
  def draw_and_add_to_hand(gambler)
    card = draw_a_card
    gambler.hand.push(card)
    card
  end

  def deal_out_cards
    @gambler_array.each do |gambler|
      card = draw_and_add_to_hand(gambler)
    end
  end

  def shuffle_deck
    @deck = @deck.shuffle
  end

  private

  def draw_a_card
    card = @deck.shift
  end
end