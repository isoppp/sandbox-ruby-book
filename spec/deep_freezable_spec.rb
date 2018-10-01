require './lib/deep_freeze'

RSpec.describe 'Deep Freeze const value.' do
  example 'deep freezable exist?' do
    expect(DeepFreezable).not_to eq nil
  end

  example 'deep freeze to array' do
    expect(Team::COUNTRIES.frozen?).to eq true # array is freeze
    expect(Team::COUNTRIES.all? {|country| country.frozen?}).to eq true # array values are freeze
  end

  example 'deep freeze to hash' do
    expect(Bank::CURRENCIES.frozen?).to eq true # hash is freeze
    expect(Bank::CURRENCIES.all? {|key, value| key.frozen? && value.frozen?}).to eq true
  end
end
