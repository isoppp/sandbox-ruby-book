# chokidar "**/*.rb" -c "bundle exec ruby study/12_others.rb"

# Time(組み込み)、Date/DateTIme

time = Time.new(2017, 1, 31, 23, 30, 59)
p time

require 'date'
date = Date.new(2017,1,31)
p date

date_time = DateTime.new(2017,1,31,23,30,59)
p date_time

# File

p File.exist?('./.editorconfig')
p Dir.exist?('./study')

File.open('./.editorconfig', 'r') do |f|
  puts f.readlines.count
end

# FileUtils
require 'fileutils'

# FileUtils.mv ('sourcefile', 'movepath')

# PathName
require 'pathname'

lib = Pathname.new('./lib')
p lib
p lib.file?
p lib.directory?
p lib.join('sample.txt').to_s # create path

# csv / json / yaml
require 'csv'
require 'json'
require 'yaml'

# env
p ENV['HOME']
p ARGV[0]
p RUBY_VERSION

# eval / backquote / send
code = "p 'hogehoge'"
eval(code)

puts `cat lib/fizz_buzz.rb` # os command ``
puts %x{cat lib/fizz_buzz.rb} # same

# Rake
# see ./Rakefile

