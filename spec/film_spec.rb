require 'rspec'
require 'film'

describe Film do
  before(:all) do
    @film = Film.new('King kong', 'Peter Jackson', '2005')
    @file_path = (__dir__) + '/fixtures/test.txt'
  end


  describe 'read_from_file' do
    it 'reads from file' do
      expect(Film.read_from_file(@file_path)).to eq(['King Kong', 'Peter Jackson', '2005'])
    end
  end

  describe 'initialize' do
    it 'creats a film object' do
      expect(@film.title).to eq('King kong')
      expect(@film.director).to eq('Peter Jackson')
      expect(@film.year).to eq('2005')
    end
  end

  describe 'to_s' do
    it 'returns a formatted string' do
      expect(@film.to_s).to eq('Peter Jackson - King kong (2005)')
    end
  end
end
