require 'rspec'
require_relative '../lib/file_reader'

describe FileReader do
  file_path = (__dir__) + '/fixtures/test.txt'
  file_reader = FileReader.new

  it 'reads from file' do
    expect(file_reader.read_from_file(file_path)).to eq(['King Kong', 'Peter Jackson', '2005'])
  end
end
