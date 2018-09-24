require './lib/convert_length'

RSpec.describe 'Convert length' do
  example 'meter to inch' do
    expect(convert_length(1, :m, :in)).to eq 39.37
  end

  example 'inch to meter' do
    expect(convert_length(15, :in, :m)).to eq 0.38
  end
end
