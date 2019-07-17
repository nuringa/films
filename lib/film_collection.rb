require 'open-uri'
require 'nokogiri'

class FilmCollection
  attr_reader :films, :directors, :collection_title

  def self.from_dir(path)
    files = Dir.children(path)

    films = files.map { |file| Film.from_file(path + "/#{file}") }

    new(films)
  end

  def self.from_list(path)
    html = open(path)
    doc = Nokogiri::HTML(html)

    films = doc.css('td.news').map { |element| Film.from_node(element) }
    collection_title = doc.css('div.myListFolders h1').text

    new(collection_title, films.take(20))
  end

  def initialize(collection_title, films)
    @collection_title = collection_title
    @films = films
    @directors = directors_uniq
  end

  def directors_uniq
    @directors = @films.map { |film| film.director}.uniq
  end

  def selected_films(user_choice)
    @films.select { |film| film.director == @directors[user_choice-1] }.sample
  end

  def to_s
    @films.join("\n")
  end
end
