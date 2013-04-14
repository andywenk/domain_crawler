# encoding: UTF-8

require File.dirname(__FILE__) + '/../spec_helper.rb'

describe Utilities do
  describe :ArgvParser do
    it "should exit the application if no options are given" do
      lambda { Utilities::ArgvParser.new([]).parse }.should raise_error SystemExit
    end
  end
end
