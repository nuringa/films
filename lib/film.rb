class Film
  attr_reader :title, :director, :year

  def self.read_from_file(file_name)
    File.readlines(file_name, chomp: true)
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
