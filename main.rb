require_relative 'lib/film'

file_names = Dir.children("data")
raise 'Не загружены файлы c фильмами' if Dir::empty?(__dir__ + '/data/')

films = []

file_names.each do |file|
  file_content = Film.read_from_file((__dir__) + '/data/' + file)
  films << Film.new(file_content[0], file_content[1], file_content[2])
end

puts 'Фильм на вечер'

directors = films.map { |film| film.director}.uniq!

directors.each.with_index(1) do |director, index|
  puts "#{index}: #{director}"
end

puts 'Фильм какого режиссера вы хотите сегодня посмотреть? Введите номер.'
user_choice = gets.to_i

puts 'И сегодня вечером рекомендую посмотреть:'

film_selected = films.select { |film| film.director == directors[user_choice-1] }.sample

puts film_selected
