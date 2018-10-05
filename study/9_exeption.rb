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

def currency_of(country)
  case country
  when :japan
    'yen'
  when :us
    'dollar'
  when :india
    'ruppe'
  else
    raise ArgumentError, "invalid country: #{country}"
  end
end

currency_of(:japan)
# currency_of(:jaapan) # ArgumentError

require 'date'

def to_date(string)
  begin
    # try to parse string
    Date.parse(string)
  rescue ArgumentError
    nil # return
  end
end

p to_date('2017-01-01')
p to_date('abcdef') #=> nil

def to_date_short(string) # same
  Date.parse(string) rescue nil
end

p to_date_short('abcdef') #=> nil
