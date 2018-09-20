require './lib/rgb'

RSpec.describe 'RGB' do
  example 'RGB' do
    expect(to_hex(0,0,0)).to eq '#000000'
    expect(to_hex(255,255,255)).to eq '#ffffff'
  end
end
