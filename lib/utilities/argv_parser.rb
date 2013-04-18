# encoding: UTF-8

require 'optparse'
require 'ostruct'

module Utilities
  class ArgvParser
    attr_accessor :args, :options

    def initialize(args)
      @args = args
      @options = OpenStruct.new
      ArgvHelper.args = @args
      @options.domain = ArgvHelper.extract_domain
    end

    def parse
      option_parser = OptionParser.new do |o|
        o.banner = ArgvHelper.banner_message
        o.set_program_name "domain_crawler v. #{DomainCrawler::VERSION}"
        o.separator ""
        o.separator "usage: domain_crawler http(s)://www.domain.com [options]"
        o.separator ""

        o.on("-a", "--abs", "follow absolute urls") do
          @options.absolute = true
        end

        o.on("-o", "--output STRING", "write results to this output file") do |output|
          @options.output = output_location(output)
        end

        o.on("-r", "--rel", "follow relative urls") do
          @options.relative = true
        end

        o.on("-s", "--save", "save data to CouchDB") do
          @options.database = true
        end

        o.on_tail("-h", "--help", "show this message") do
          puts o
          puts
          exit
        end

        o.on_tail("-v", "--version", "show version") do
          puts version
          exit
        end
      end

      option_parser.parse!(@args)

      rescue OptionParser::MissingArgument => error
        puts "Recheck your arguments please -> #{error}"
        exit

      rescue OptionParser::InvalidOption => error
        puts "There is a problem with your options -> #{error}"
        exit
    end
  end
end
