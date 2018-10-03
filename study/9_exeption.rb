# chokidar "**/*.rb" -c "bundle exec ruby study/9_exeption.rb"

module Greeter

end

begin
  greeter = Greeter.new
rescue NoMethodError => e
  puts 'catch no method error'
  puts "error class is #{e.class}"
  puts "error message is #{e.message}"
  puts "backtrace is #{e.backtrace}"
rescue => e
  puts "error class is #{e.class}"
  puts "error message is #{e.message}"
  puts "backtrace is #{e.backtrace}"
end

p 'hoge'

begin
  Greeter.no_method
rescue NameError
  # can call
rescue NoMethodError
  # never call here
  # because NoMethodError NameError < StandardError < Exeption class tree
  # and, catch NoMethod error include NameError
end


retry_count = 0
begin
  puts 'start progream...'

  1 / 0 # exec error
rescue
  retry_count += 1
  if retry_count <= 3
    puts "retry total: #{retry_count}"
    retry
  else
    puts 'failed retry X<'
  end
end

def corrency_of(country)
  case country
  when :japan
    'yen'
  when :us
    'dollar'
  when :india
    'ruppe'
  else
    raise "invalid country: #{country}"
  end
end

corrency_of(:japan)
corrency_of(:jaapan)
