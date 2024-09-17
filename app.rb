# frozen_string_literal: true

attempts = 9

secret_number = ''
4.times do
  secret_number += rand(0..9).to_s
end
arr_secret_number = secret_number.chars

puts 'Вітаю! Щойно було загадано чотиризначне число (цифри від 0 до 9, можуть бути кілька разів).'
puts "Спробуйте вгадати його за #{attempts} спроб."
puts 'Після кожної спроби буде підказка скільки цифр на свому місці, а скільки - ні.'

while attempts.positive?
  puts 'Введіть чотиризначне число:'
  enter_number = gets.strip
  if enter_number.gsub(/[^0-9]/, '').length != enter_number.length
    puts 'Введено не число!'
  elsif enter_number.length != 4
    puts 'Введено не чотиризначне число!'
  elsif enter_number == secret_number
    puts "Вітаємо! Число #{secret_number} вгадано :)"
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

    puts "#{same_place} на свому місці, #{different_place} не на свому місці. Залишилось #{attempts} спроб."

    puts "Спроби закінчились. Було загадано #{secret_number} :(" if attempts.zero?
  end
end
