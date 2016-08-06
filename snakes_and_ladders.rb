class Game
  def initialize(players, board_size=100)
    @players = players
    @board_size = board_size
    @snakes_ladders = {26=>39, 88=>73, 24=>45, 19=>63, 7=>14, 2=>61, 4=>63, 37=>17, 69=>70, 38=>48, 58=>7, 8=>45, 48=>50, 5=>7, 63=>9, 40=>97, 27=>6, 66=>82}
  end


  def random_cell_value(board_size)
     1 + rand(board_size - 1)
  end

  
  def play
    players_starting_positions = @players.map{0}
    starting_player = rand(@players.length)
    winner = move(players_starting_positions, starting_player)
    puts "#{@players[winner]} won!"
  end
  

  def roll_dice
    1 + rand(6)
  end
  
  def move(players, player_turn)
    p @players[player_turn] + "'s turn"
    p players
    old_position = players[player_turn]
    dice_value = roll_dice
    new_position = old_position + dice_value
    p "Dice Value #{dice_value}"
    new_position = @snakes_ladders[new_position] if @snakes_ladders.has_key?(new_position)
    p "#{@players[player_turn]} moved from #{old_position} position to #{new_position}"
    p '--------------------------------------------------------------------------'
    return player_turn if new_position >= @board_size 
      players[player_turn] = new_position
      next_player = (player_turn + 1) % players.length
      move(players, next_player)
  end
end

players = ["Akshay", "Akash", "Bharath"]
game = Game.new(players)
# game = Game.new(players, 50) // you can set your board size
game.play
