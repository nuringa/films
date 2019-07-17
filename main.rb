require 'open-uri'
require 'nokogiri'
require_relative 'lib/film'
require_relative 'lib/film_collection'

puts 'Фильм на вечер'

puts 'Выбираем из домашней библиотеки или из Кинопоиска?'
puts '1. Фильмы из папки 2. Фильмы с сайта "Кинопоиск"'

user_choice = STDIN.gets.to_i

if user_choice == 1
  film_collection = FilmCollection.from_dir("#{__dir__}/data")
else
  film_collection = FilmCollection.from_list('https://www.kinopoisk.ru/top/lists/294/')
  puts 'Выбираем из коллекции www.kinopoisk.ru:'
  puts film_collection.collection_title
end

film_collection.directors.each.with_index(1) do |director, index|
  puts "#{index}: #{director}"
end

puts 'Фильм какого режиссера вы хотите сегодня посмотреть? Введите номер.'
user_choice = gets.to_i

puts 'И сегодня вечером рекомендую посмотреть:'

puts film_collection.selected_films(user_choice)
