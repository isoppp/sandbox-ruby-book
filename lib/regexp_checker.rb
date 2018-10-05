# ruby lib/regexp_checker.rb

print 'Text?: '
text = gets.chomp

begin

print 'Pattern?: '
pattern = gets.chomp
regexp = Regexp.new(pattern)

rescue RegexpError => e
  puts "Invalid pattern: #{e.message}"
  retry

ensure
  puts "ensure"
end

matches = text.scan(regexp)

if matches.size > 0
  puts "Matched: #{matches.join(',')}"
else
  puts "Nothing matched"
end
