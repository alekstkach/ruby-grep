# encoding: UTF-8

module RubyGrep

  class Line

    attr_reader :contents, :number, :file

    def initialize(contents, number, file)
      @contents  = contents
      @number    = number + 1
      @file      = file
      @file_name = @file.file_name
    end

    def colorized_line(expression)
      "\s\s\s\s#{colorize_line_number(aligned_line_number)}: #{colorize_text(expression).lstrip}"
    end

    def aligned_line_number
      shift = @file.max_line_number_length
      sprintf("%#{shift}d", @number)
    end

    private

      def colorize_text(expression)
        matched_text = @contents.match(expression.value)[0].colorize(color: :black, background: :white)
        @contents.gsub(expression.value, matched_text)
      end

      def colorize_line_number(number)
        number.colorize(color: :magenta)
      end

  end

end