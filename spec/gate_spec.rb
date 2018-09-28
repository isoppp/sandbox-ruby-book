require './lib/Gate'
require './lib/Ticket'

RSpec.describe 'Gate Test /' do
  example 'create class' do
    expect(Gate.new(:some)).to_not eq nil
  end

  example 'umeda to juso' do
    umeda = Gate.new(:umeda)
    juso = Gate.new(:juso)

    ticket = Ticket.new(150)
    umeda.enter(ticket)
    expect(juso.exit(ticket)).to eq true
  end
end
