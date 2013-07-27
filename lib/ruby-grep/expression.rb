module RubyGrep

  class Expression

    def initialize(expression)
      @expression = parse_expression(expression)
    end

    def value
      @expression.force_encoding("UTF-8")
    end

    private

      def parse_expression(expression)
        if expression[0] == '/' && expression[expression.length - 1] == '/'
          Regexp.compile(expression.chomp('/').sub(/\A\//, ''))
        else
          expression.sub(/\A(("(.*)")|('(.*)'))\Z/, '\3\5')
        end
      end
  end

end

