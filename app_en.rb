# frozen_string_literal: true

puts 'Before starting the game, you need to enter the number of signs in the guessed number and the number of attempts.'
puts 'There is no limit to their size, but too many signs or attempts make the game pointless.'
puts 'Recommended to enter the number of characters in a single digit, and attempts no more than a two-digit number.'
puts 'After each attempt, there will be a hint as to how many digits are in their place, and how many are not.'

digits = ''
loop do
  puts 'Enter the number of characters in the number you want to guess:'
  digits_input = gets.strip
  if digits_input.gsub(/[^0-9]/, '').length != digits_input.length
    puts 'Not the number was entered!'
  elsif digits_input.to_i.zero?
    puts 'The number of characters cannot be zero!'
  else
    digits = digits_input.to_i
    break
  end
end

attempts = ''
loop do
  puts 'Enter the number of attempts to guess:'
  attempts_input = gets.strip
  if attempts_input.gsub(/[^0-9]/, '').length != attempts_input.length
    puts 'Not the number was entered!'
  elsif attempts_input.to_i.zero?
    puts 'The number of attempts cannot be zero!'
  else
    attempts = attempts_input.to_i
    break
  end
end

secret_number = ''
digits.times do
  secret_number += rand(0..9).to_s
end
arr_secret_number = secret_number.chars

puts 'The game has begun!'
puts "We guess a #{digits}-digit number (digits from 0 to 9 can be repeated several times)."
puts "Try to guess it in #{attempts} attempts."

while attempts.positive?
  puts "Enter a #{digits}-digit number:"
  enter_number = gets.strip
  if enter_number.gsub(/[^0-9]/, '').length != enter_number.length
    puts 'Not the number was entered!'
  elsif enter_number.length != digits
    puts "A non-#{digits}-digit number was entered!"
  elsif enter_number == secret_number
    puts "Congratulations! The number #{secret_number} has been guessed :)"
    break
  else
    same_place = 0
    arr_enter_number = enter_number.chars
    attempts -= 1
    arr_secret_different = []
    arr_enter_different = []
    arr_secret_number.each_with_index do |secret_number, secret_index|
      if secret_number == arr_enter_number[secret_index]
        same_place += 1
      else
        arr_secret_different << secret_number
        arr_enter_different << arr_enter_number[secret_index]
      end
    end

    arr_enter_different.each do |element|
      arr_secret_different[arr_secret_different.index(element)] = 'x' unless arr_secret_different.index(element).nil?
    end
    different_place = arr_secret_different.count('x')

    puts "#{same_place} in its place, #{different_place} out of place. There are still attempts: #{attempts}."

    puts "The attempts are over. It was #{secret_number} :(" if attempts.zero?
  end
end
