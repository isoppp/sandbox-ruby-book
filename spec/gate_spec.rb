require './lib/Gate'
require './lib/Ticket'

RSpec.describe 'Gate Test /' do
  before do
    @umeda = Gate.new(:umeda)
    @juso = Gate.new(:juso)
    @mikuni = Gate.new(:mikuni)
  end

  example 'create class' do
    expect(Gate.new(:some)).to_not eq nil
  end

  example 'umeda to juso should be able to exit' do
    ticket = Ticket.new(150)
    @umeda.enter(ticket)
    expect(@juso.exit(ticket)).to eq true
  end

  example 'umeda to mikuni should be not able to exit' do
    ticket = Ticket.new(150)
    @umeda.enter(ticket)
    expect(@mikuni.exit(ticket)).to eq false
  end

  example 'umeda to mikuni should be able to exit' do
    ticket = Ticket.new(190)
    @umeda.enter(ticket)
    expect(@mikuni.exit(ticket)).to eq true
  end

  example 'juso to mikuni should be able to exit' do
    ticket = Ticket.new(150)
    @juso.enter(ticket)
    expect(@mikuni.exit(ticket)).to eq true
  end
end
