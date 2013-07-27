require 'spec_helper'

describe RubyGrep::Directory do

  it "finds all files in the directory and sub directories" do
    Dir.mkdir(TEMP_DIRECTORY_SPEC_TEST_PATH)
    Dir.mkdir(TEMP_DIRECTORY_SPEC_TEST_PATH_INNER)
    # `touch #{DIRECTORY_SPEC_TEST_PATH}/file#{n}`
    5.times do |n|
      FileUtils.touch(TEMP_DIRECTORY_SPEC_TEST_PATH + "/file#{n}")
    end
    5.times do |n|
      FileUtils.touch(TEMP_DIRECTORY_SPEC_TEST_PATH_INNER + "/file#{n}")
    end

    RubyGrep::Directory.new(TEMP_DIRECTORY_SPEC_TEST_PATH).files.length.should == 10

    FileUtils.rm_rf(TEMP_DIRECTORY_SPEC_TEST_PATH)
    # %x{rm -rf #{TEMP_DIRECTORY_SPEC_TEST_PATH}}
  end

  it "returns array of files of type RubyGrep::File" do
    Dir.mkdir(TEMP_DIRECTORY_SPEC_TEST_PATH)
    Dir.mkdir(TEMP_DIRECTORY_SPEC_TEST_PATH_INNER)
    5.times do |n|
      FileUtils.touch(TEMP_DIRECTORY_SPEC_TEST_PATH + "/file#{n}")
    end
    5.times do |n|
      FileUtils.touch(TEMP_DIRECTORY_SPEC_TEST_PATH_INNER + "/file#{n}")
    end
    file_objects_array = RubyGrep::Directory.new(TEMP_DIRECTORY_SPEC_TEST_PATH).files
    file_objects_array.each do |file|
      file.is_a?(RubyGrep::File).should == true
    end
  end

end