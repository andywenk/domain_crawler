# encoding: UTF-8

module Utilities
  class ArgvHelper
    def self.args=(args)
      @@args = args
    end

    def self.args
      @@args
    end

    def self.extract_domain
      return if help_requested?
      is_domain_given?
      args.shift
    end

    def self.help_requested?
      (args[0] =~ /^-h|--help$/) == 0
    end

    def self.is_domain_given?
      unless (args[0] =~ /^https?:\/\//) == 0
        puts "\n  You have to provide at least a domain like http(s)://www.example.com\n\n"
        exit(0)
      end
    end

    def self.output_location(output)
      case output
      when /^\//
        output
      when /^\.\//
        output
      else
        File.expand_path("../../../../#{output}", __FILE__)
      end
    end

    def self.banner_message
      <<-EOT

  domain_crawler v. #{DomainCrawler::VERSION}

  This program is intended to crawl all links on a website and produce
  an output created upon the given options. Please visit
  #{DomainCrawler::HOMEPAGE} for source code and documentation.
EOT
    end
  end
end
