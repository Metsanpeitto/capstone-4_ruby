require_relative '../texts'
require_relative '../classes/categories/game'

def create_game(item)
  Texts.text_ci4('game')
  last_played_at = gets.chomp
  Texts.text_ci3('game', 'multiplayer? (y/n)')
  multiplayer = gets.chomp
  game = Game.new(multiplayer, last_played_at, item)
  @games << game
  Texts.success('game')
  game
end
