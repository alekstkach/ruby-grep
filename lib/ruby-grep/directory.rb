module RubyGrep

  class Directory

    def initialize(path)
      @path = path
    end

    def files
      @files ||= Dir.glob(::File.join("#{@path}", "**", "{*,.*}")).select { |f| ::File.file?(f) }.
      map { |file_name| RubyGrep::File.new("#{file_name}") }
    end

  end

end

