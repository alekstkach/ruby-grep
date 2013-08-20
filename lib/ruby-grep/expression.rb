# encoding: UTF-8

module RubyGrep

  class Expression

    def initialize(expression)
      @expression = parse_expression(expression)
    end

    def value
      @expression
    end

    private

      def parse_expression(expression)
        passed_options = get_regexp_options(expression)

        expression_with_no_options = expression.sub(/\/([im]+?)\Z/, '/')

        if expression_with_no_options[0] == '/' && expression_with_no_options[expression_with_no_options.length - 1] == '/'
          Regexp.compile(expression_with_no_options.chomp('/').sub(/\A\//, ''), passed_options )
        else
          expression.sub(/\A(("(.*)")|('(.*)'))\Z/, '\3\5')
        end
      end

      # getting an array of options passed to regexp /lalala/options => [o,p,t,i,o,n,s]
      def get_regexp_options(expression)
        case expression.scan(/\/([im]+?)\Z/).join.split('')
          when ["i"]
            Regexp::IGNORECASE
          when ["m"] 
            Regexp::MULTILINE
          when ["m", "i"]
            Regexp::IGNORECASE | Regexp::MULTILINE
          when ["i", "m"] 
            Regexp::IGNORECASE | Regexp::MULTILINE
          else 
            nil | nil 
          end
      end

  end

end

