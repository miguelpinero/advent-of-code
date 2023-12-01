require 'pry'
require '../utils'

def run
  input_data = Utils.read_file(day: 1)
  calories_per_elf = []
  current_calories = 0

  input_data.each do |calories|
    if calories.empty?
      calories_per_elf.push(current_calories)
      current_calories = 0
      next
    end

    current_calories += calories.to_i
  end

  calories_per_elf.sort.reverse.first(3).sum
end

run