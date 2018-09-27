# chokidar "**/*.rb" -c "bundle exec ruby study/6_regexp.rb"

regex = /\d{3}-\d{4}/
p regex.class

p '123-4567' =~ regex #=> 0 / return start position
p 'hello' =~ regex #=> nil / return nil if any word isn't match

m = /(\d{3})-(\d{4})/.match('123-4567')
p m
p m.class #=> MatchData

p [m[0], m[1], m[2]]


if mm = /(\d{3})-(\d{4})/.match('123-4567') # 代入しながらif
  p mm
end

# name capture
mmm = /(?<num1>\d{3})-(?<num2>\d{4})/.match('123-4567')
p mmm
p mmm[:num1]

if /(?<num1>\d{3})-(?<num2>\d{4})/ =~ ('123-4567')
  p [num1, num2]
end

# string base
p '123-4567'.scan(/\d+-\d+/) #=> ["123-4567"]
p '123-4567'[/\d+/] #=> "123"
p '123-4567'[/\d+/] == '123-4567'.slice(/\d+/) #=> alias

p '123-4567'.gsub(/(\d+)/, '\1|')

gsubHash = {'/' => '///', '-'=> '---' }
p '123/45-67'.gsub(/\/|-/, gsubHash)

