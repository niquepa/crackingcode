# 1 dealer, 1 player
# deal two cards each one,

# class Card
#   attr_accessor :label, :value
#
#   def initialize(value)
#     @label = label
#     @value = value
#   end
#
#   private
#
#     def return_value
#       return
#     end
#
#     def is_an_ace?
#
#     end
# end

class Player
  attr_accessor :name, :score, :cards
  MAX_SCORE = 21

  def initialize(name)
    @name = name
    @cards = []
  end

  def new_card(card)
    @cards.push(card)
    if card == 0
      if @score + 11 > MAX_SCORE
        @score += 1
      else
        @score += 11
      end
    else
      @score += card
    end
    @score
  end

  def could_get_new_card?
    return score < MAX_SCORE
  end

end

class Dealer < Player

  def could_get_new_card?
    return score < MAX_SCORE && score < 17
  end
end




class Game
  DECK = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 10, 10, 10, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 10, 10, 10, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 10, 10, 10, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 10, 10, 10, 0, 0, 0, 0]
  attr_accessor :dealer, :players


  def initialize(dealer, players)
    @dealer = dealer
    @players = players
    @deck = DECK
    # check that you have dealer annd at least one player, not more than XX players
  end

  def start_game
    @players.concat(@dealer).each do |player|
      (1..2).each do
        card = @deck.delete_at(51)
        player.new_card(card)
      end
    end
  end

  def new_round
    @players.each do |player|
      give_a_card(player) if player.could_get_new_card?
      @players.delete(player) if new_score > 21
    end
    give_a_card(dealer) if dealer.could_get_new_card?
  end

  def is_active?
    @players.each do |player|
      return true if player.could_get_new_card? && @dealer.could_get_new_card?
    end
  end

  def show_winner
    return "Dealer lost" if @dealer.score > 21
    winner = @dealer
    @players.each do |player|
      winner = player if player.score < 22 && player.score > @dealer.score && player.score > winner.score
    end
    winner
  end

  private

    def give_a_card(player)
      card = @deck.delete_at(51)
      player.new_card(card)
    end

end

dealer = Dealer.new("Dealer")
player1 = Player.new("Player1")
game = Game.new(dealer, [player1])

game.start_game
while(game.is_active?) do
  game.new_round
end

game.show_winner