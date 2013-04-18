# encoding: UTF-8

require 'optparse'
require 'ostruct'

module Utilities
  class ArgvParser
    def initialize(args)
      @args = args
      @version = DomainCrawler::VERSION
      @homepage = DomainCrawler::HOMEPAGE
      @options = OpenStruct.new
      @options = extract_domain
    end

    def parse
      option_parser = OptionParser.new do |o|
        o.banner = banner_message
        o.set_program_name "domain_crawler v. #{@version}"
        o.separator ""
        o.separator "usage: domain_crawler http(s)://www.domain.com [options]"
        o.separator ""

        o.on("-a", "--abs", "follow absolute urls") do
          @options.absolute = true
        end

        o.on("-o", "--output STRING", "write results to this output file") do |output|
          @options. output = output_location(output)
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

      rescue OptionParser::MissingArgument => error
        puts "Recheck your arguments please -> #{error}"
        exit

      rescue OptionParser::InvalidOption => error
        puts "There is a problem with your options -> #{error}"
        exit

      option_parser.parse!(@args)
    end

    def extract_domain
      return if help_requested?
      is_domain_given?
      @options.domain = @args.shift
    end

    def help_requested?
      (@args[0] =~ /^-h|--help$/) == 0
    end

    def is_domain_given?
      unless (@args[0] =~ /^https?:\/\//) == 0
        puts "\n  You have to provide at least a domain like http(s)://www.example.com\n\n"
        exit(0)
      end
    end

    def banner_message
      <<-EOT

  domain_crawler v. #{@version}

  This program is intended to crawl all links on a website and produce
  an output created upon the given options.
  Please visit #{@homepage} for source code and documentation.
EOT
    end
  end
end
