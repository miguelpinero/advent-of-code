require_relative '../utils'

@input_data = Utils.read_file(day: 1)
@numbers_in_letters = { zero: 0, one: 1, two: 2, three: 3, four: 4, five: 5, six: 6, seven: 7, eight: 8, nine: 9 }

def get_numbers_from_letters(number_in_letters)
  if @numbers_in_letters.has_key? number_in_letters.to_sym
    return @numbers_in_letters[number_in_letters.to_sym]
  elsif @numbers_in_letters.has_key? number_in_letters.reverse.to_sym
    return @numbers_in_letters[number_in_letters.reverse.to_sym]
  end

  return nil
end

def run
  total_sum = 0

  @input_data.each do |code|  
    # First, we get the first digit
    first_digit = code.scan(/\d|zero|one|two|three|four|five|six|seven|eight|nine/).first
    
    # Then, we get the last digit
    last_digit = code.reverse.scan(/\d|orez|eno|owt|eerht|ruof|evif|xis|neves|thgie|enin/).first

    # Now, we check if numbers are in letters and we get the number
    first_digit = get_numbers_from_letters(first_digit) || first_digit
    last_digit = get_numbers_from_letters(last_digit) || last_digit

    # Finally, we get the calibration code
    calibration_code = "#{first_digit}#{last_digit}".to_i

    # And we add it to the total sum
    total_sum += calibration_code

    puts "Calibration code for #{code} is: #{calibration_code}"
  end

  puts "Total sum is: #{total_sum}"
end

run
