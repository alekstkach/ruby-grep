require 'spec_helper'

describe RubyGrep::Expression do
  
  before(:each) do
    @regexp_expression = "/gimme immediate/i"
    @string_expression = '"gimme "immediate"/i"'
  end

  describe "#value" do

    it "returns parsed string expression" do
      pending "needs investigation"
      RubyGrep::Expression.new(@string_expression).value.is_a?(String).should be_true
      RubyGrep::Expression.new(@string_expression).value.should == "gimme 'immediate'/i"
      # It doesnt replace ""/'' for some f reason
    end

    it "returns perced regexp expression" do
      RubyGrep::Expression.new(@regexp_expression).value.is_a?(Regexp).should be_true
      RubyGrep::Expression.new(@regexp_expression).value.should == /gimme immediate/i
    end

  end


end