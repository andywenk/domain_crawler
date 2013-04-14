# encoding: UTF-8

require File.dirname(__FILE__) + '/../spec_helper.rb'

describe DomainCrawler do
  describe 'VERSION' do
    it "should have a version number as a String" do
      DomainCrawler::VERSION.should be_an_instance_of(String)
    end

    it "should have a version number in the format 0.0.0" do
      DomainCrawler::VERSION.should match(/^\d\.\d\.\d$/)
    end
  end
end
