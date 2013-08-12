require 'spec_helper'

describe RubyGrep::File do
  
  before(:each) do
    @file = RubyGrep::File.new(File.dirname(__FILE__) + '/fixtures/test_file.txt')
  end
  
  describe "#match" do
  
    it "selects lines from the file that match the regexp" do
      @file.match(RubyGrep::Expression.new("/R..y/i")).size.should == 5 # i how the fuck i am supposed to solve it
    end
    
    it "selects lines from the file that match the string" do
      @file.match(RubyGrep::Expression.new("ruby")).size.should == 3
    end
    
  end
  
  it "colorizes matches" do
    @file.colorized_filename.should == File.dirname(__FILE__) + "/fixtures/" + "\e[0;33;49m" + "test_file.txt" + "\e[0m"
  end
  
  it "finds the longest line number" do
    @file.max_line_number_length.should == 1
  end
   
  # 
end  