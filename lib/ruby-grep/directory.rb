# encoding: UTF-8

module RubyGrep

  class Directory

    def initialize(path)
      @path = path
    end

    # this method finds all entries in the @path (directory) including all in all sudirectories of the
    # given @path and returns them as an array of elements of type RubyGrep::File
    def files
      @files ||= Dir.glob(::File.join("#{@path}", "**", "{*,.*}")).select { |f| ::File.file?(f) }.
      map { |file_name| RubyGrep::File.new("#{file_name}") }
    end

  end

end

