# encoding: UTF-8

module RubyGrep
  
  class File

    attr_reader :file_name

    def initialize(fn)
      @lines = ::File.read(fn).encode!('UTF-8', 'UTF-8', :invalid => :replace).split("\n")
      @lines.map! { |line| RubyGrep::Line.new(line, @lines.index(line), self) }
      @file_name = fn
    end
    
    # this method selects lines from the file that match the expression, 
    # which may be a string or regexp.
    def match(expression)
      @lines.select { |line| line.contents.match(expression.value) }
    end

    def colorized_filename
      filename = @file_name.scan(/\/(\.?\w+\.\w+)|(\.\w+)/).join
      colorised_filename = filename.colorize(:yellow)
      @file_name.gsub(filename, colorised_filename)
    end

    def max_line_number_length
      return @max_line_number_length if @max_line_number_length
      @max_line_number_length = 1
      @lines.each do |line|
        if line.number.to_s.length > @max_line_number_length
          @max_line_number_length = line.number.to_s.length
        end
      end
      @max_line_number_length
    end
    
    private 

      
  end

end