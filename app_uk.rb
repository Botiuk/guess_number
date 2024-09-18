# frozen_string_literal: true

puts 'Перед тим як розпочати гру, потрібно ввести кількість знаків у числі, що вгадується, та кількість спроб.'
puts 'Обмежень на їх величину немає, але дуже велика кількість знаків чи спроб перетворює гру на безглузду.'
puts 'Рекомендується кількість знаків вводити однією цифрою, а спроб не більше двозначного числа.'
puts 'Після кожної спроби буде підказка скільки цифр на свому місці, а скільки - ні.'

digits = ''
loop do
  puts 'Введіть кількість знаків у числі, яке хочете вгадувати:'
  digits_input = gets.strip
  if digits_input.gsub(/[^0-9]/, '').length != digits_input.length
    puts 'Введено не число!'
  elsif digits_input.to_i.zero?
    puts 'Кількість знаків не може бути нулем!'
  else
    digits = digits_input.to_i
    break
  end
end

attempts = ''
loop do
  puts 'Введіть кількість спроб для вгадування:'
  attempts_input = gets.strip
  if attempts_input.gsub(/[^0-9]/, '').length != attempts_input.length
    puts 'Введено не число!'
  elsif attempts_input.to_i.zero?
    puts 'Кількість спроб не може бути нульовою!'
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

puts 'Гра розпочалась!'
puts "Щойно було загадано #{digits}-значне число (цифри від 0 до 9, можуть бути кілька разів)."
puts "Спробуйте вгадати його з #{attempts} спроб."

while attempts.positive?
  puts "Введіть #{digits}-значне число:"
  enter_number = gets.strip
  if enter_number.gsub(/[^0-9]/, '').length != enter_number.length
    puts 'Введено не число!'
  elsif enter_number.length != digits
    puts "Введено не #{digits}-значне число!"
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

    puts "#{same_place} на своєму місці, #{different_place} не на своєму місці. Спроб залишилось: #{attempts}."

    puts "Спроби закінчились. Було загадано #{secret_number} :(" if attempts.zero?
  end
end
