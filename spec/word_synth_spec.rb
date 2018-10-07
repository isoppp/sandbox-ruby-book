require './lib/word_synth'

RSpec.describe 'Word Synth test' do
  example "should word synth class and effect module exist" do
    expect(WordSynth).not_to eq nil
    expect(Effects).not_to eq nil
  end

  example "should be reverse" do
    effect = Effects.reverse
    expect(effect.call('ybuR si !nuf')).to eq 'Ruby is fun!'
  end

  example "should be echo" do
    effect = Effects.echo(2)
    expect(effect.call('Ruby is fun!')).to eq 'RRuubbyy iiss ffuunn!!'

    effect = Effects.echo(3)
    expect(effect.call('Ruby is fun!')).to eq 'RRRuuubbbyyy iiisss fffuuunnn!!!'
  end

  example "loud effect should be convert upper case" do
    effect = Effects.loud(2)
    expect(effect.call('Ruby is fun!')).to eq 'RUBY!! IS!! FUN!!!'

    effect = Effects.loud(3)
    expect(effect.call('Ruby is fun!')).to eq 'RUBY!!! IS!!! FUN!!!!'
  end
end
