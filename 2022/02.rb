require 'pry'
require '../utils'

@input_data = Utils.read_file(day: 2)
@movements = { A: :Z, B: :X, C: :Y, X: :C, Y: :A, Z: :B }
@scores = {
  A: 1, # Rock 
  B: 2, # Paper
  C: 3, # Scissors
  X: 1, # Rock
  Y: 2, # Paper
  Z: 3  # Scissors
}

def get_winner(first_player, second_player)
  return first_player if @movements[first_player].eql? second_player
  return second_player if @movements[second_player].eql? first_player
end

def first_part
  total_score = 0
  @input_data.each do |round|
    first_player, second_player = round.split(" ").map(&:to_sym)
    winner = get_winner(first_player, second_player)
    
    case winner
    when first_player
      total_round = 0
    when second_player
      total_round = 6
    else
      total_round = 3
    end

    total_score += total_round + @scores[second_player]
  end

  total_score
end

def second_part
  total_score = 0
  @input_data.each do |round|
    first_player_movement, behavior = round.split(" ").map(&:to_sym)
    
    case behavior
    when :Y # We should draw
      our_movement = first_player_movement
      total_round = 3
    when :X # We should loss
      our_movement = @movements.fetch(first_player_movement)
      total_round = 0
    when :Z # We should win
      our_movement = @movements.key(first_player_movement)
      total_round = 6
    end

    total_score += total_round + @scores[our_movement]
  end

  total_score
end

puts first_part
puts second_part