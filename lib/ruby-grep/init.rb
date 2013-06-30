require_relative 'directory'
require_relative 'expression'
require_relative 'file'
require 'colorize'
require_relative 'line'
require 'debugger'

expression = RubyGrep::Expression.new(ARGV.drop(1).join(' ')) 

d = RubyGrep::Directory.new(ARGV[0])
d.files.each do |file|
  puts file.colorized_filename unless file.match(expression).empty?
  file.match(expression).each do |line|
    puts line.colorized_line(expression)
  end
end


