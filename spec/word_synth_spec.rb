require './lib/word_synth'

RSpec.describe 'Effects Test' do
  example "should exist Effects module" do
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

RSpec.describe 'Word Synth Test' do
  example 'should exist WordSynth class' do
    expect(WordSynth).not_to eq nil
  end

  example "should be return original word" do
    synth = WordSynth.new
    expect(synth.play('Ruby is fun!')).to eq 'Ruby is fun!'
  end

  example "play reverse should be reverse" do
    synth = WordSynth.new
    synth.add_effect(Effects.reverse)
    expect(synth.play('Ruby is fun!')).to eq 'ybuR si !nuf'
  end

  example 'mix effect' do
    synth = WordSynth.new
    synth.add_effect(Effects.echo(2))
    synth.add_effect(Effects.loud(3))
    synth.add_effect(Effects.reverse)
    expect(synth.play('Ruby is fun!')).to eq '!!!YYBBUURR !!!SSII !!!!!NNUUFF'
  end
end
