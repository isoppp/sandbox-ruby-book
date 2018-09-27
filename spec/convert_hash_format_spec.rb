require './lib/convert_hash_format'

exampleText = <<~TEXT
{
  :name => 'Alice',
  :age=> 20,
  :gendar  => :female
}
TEXT

expectText = <<~TEXT
{
  name: 'Alice',
  age: 20,
  gendar: :female
}
TEXT

RSpec.describe 'Convert Hash' do
  example 'long to short' do

    expect(convert_hash_format(exampleText)).to eq expectText
  end
end
