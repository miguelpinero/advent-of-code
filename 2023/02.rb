require_relative '../utils'

@input_data = Utils.read_file(day: 2)
@cubes = { red: 12, green: 13, blue: 14 }

def run
  possible_games = []
  power_cubes = 0

  @input_data.each do |current|  
    possible = true

    meta, rounds = current.split(":")
    game_id = meta.split(" ").last  

    max_per_color = { red: 0, green: 0, blue: 0 }
    rounds.split(";").each do |iteration|
      iteration.split(",").each do |cubes|
        amount, color = cubes.split(" ")
        max_per_color[color.to_sym] = amount.to_i if amount.to_i > max_per_color[color.to_sym]

        next unless possible
        possible = @cubes[color.to_sym].to_i >= amount.to_i
      end
    end

    power_cubes += max_per_color.values.inject(&:*)
    possible_games << game_id if possible
  end

  puts "Possible games (Ids): #{possible_games.join(', ')}"
  puts "Total sum (Game Ids): #{possible_games.map(&:to_i).sum}"
  puts "Power cubes: #{power_cubes}"
end

run
