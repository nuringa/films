require_relative 'lib/film'
require_relative 'lib/film_collection'

film_collection = FilmCollection.from_dir("#{__dir__}/data")

puts 'Фильм на вечер'

film_collection.directors.each.with_index(1) do |director, index|
  puts "#{index}: #{director}"
end

puts 'Фильм какого режиссера вы хотите сегодня посмотреть? Введите номер.'
user_choice = gets.to_i

puts 'И сегодня вечером рекомендую посмотреть:'

puts film_collection.selected_films(user_choice)


