module RubyGrep
  
  class File

    attr_reader :file_name

    def initialize(file_name)
      @lines = ::File.readlines(file_name)
      @lines.map! { |line| RubyGrep::Line.new(line, @lines.index(line), self) }
      @file_name = file_name
    end

    def match(expression)
      @lines.select { |line| line.contents.match(expression.value) }
    end

    def colorized_filename
      filename = @file_name.scan(/\/(\.?\w+\.\w+)|(\.\w+)/).join
      colorised_filename = filename.colorize(:yellow)
      @file_name.gsub(filename, colorised_filename)
    end

    def no_files_message(file)
      raise "No files to search in" unless file.exists?
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