class FilmCollection
  attr_reader :films, :directors

  def self.from_dir(path)
    files = Dir.children(path)

    films = files.map { |file| Film.from_file(path + "/#{file}") }

    new(films)
  end

  def self.from_list(path)
    html = open(path)
    doc = Nokogiri::HTML(html)

    nodes = doc.css('td.news').each { |node| node.css('a.all').text }

    films = nodes.map { |element| Film.from_node(element) }

    new(films.take(20))
  end

  def initialize(films)
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
