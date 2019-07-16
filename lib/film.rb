class Film
  attr_reader :title, :director, :year

  def self.from_file(file_name)
    file_content = File.readlines(file_name, chomp: true)
    new(file_content[0], file_content[1], file_content[2])
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
