class Film
  attr_reader :title, :director, :year

  DIRECTOR_REGEX = /реж\..+/
  YEAR_REGEX = /[12]\d{3}/

  def self.from_file(file_name)
    file_content = File.readlines(file_name, chomp: true)
    new(file_content[0], file_content[1], file_content[2])
  end

  def self.from_node(node)
    title = node.css('a.all').text.to_s
    director = node.text.match(DIRECTOR_REGEX).to_s.delete_prefix('реж. ')
    director = director.delete_suffix('...')
    year = node.text.match(YEAR_REGEX).to_s

    new(title, director, year)
  end

  def initialize(title, director, year)
    @title = title
    @director = director
    @year = year
  end

  def to_s
    "#{@director} - #{@title} (#{@year})"
  end
end
