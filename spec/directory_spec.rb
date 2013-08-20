require 'spec_helper'

TEMP_DIR = File.dirname(__FILE__) + '/directory_spec_test'

describe RubyGrep::Directory do

  it "finds all files in the directory and sub directories" do
    [ TEMP_DIR, TEMP_DIR + '/nested_level1', TEMP_DIR + '/nested_level1/nested_level2' ].each do |d|
      Dir.mkdir(d)
      5.times do |n|
        FileUtils.touch(d + "/file#{n}")
      end
    end
   
    RubyGrep::Directory.new(Dir.new(TEMP_DIR).path).files.length.should == 15

    FileUtils.rm_rf(Dir.new(TEMP_DIR).path)
    
  end

  it "returns array of files of type RubyGrep::File" do
    Dir.mkdir(TEMP_DIR)
    Dir.mkdir(TEMP_DIR + '/nested_level1')
    5.times do |n|
      FileUtils.touch(TEMP_DIR + "/file#{n}")
    end
    5.times do |n|
      FileUtils.touch(TEMP_DIR + "/file#{n}")
    end
    file_objects_array = RubyGrep::Directory.new(TEMP_DIR).files
    file_objects_array.each do |file|
      file.is_a?(RubyGrep::File).should == true
    end
    FileUtils.rm_rf(TEMP_DIR)
  end

end