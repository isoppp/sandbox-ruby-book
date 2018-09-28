require './lib/gate'

RSpec.describe 'Gate Test' do
  example 'create class' do
    expect(Gate.new).to_not eq nil
  end
end
