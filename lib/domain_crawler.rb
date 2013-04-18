# encoding: UTF-8

require 'domain_crawler/version'
require 'domain_crawler/config'
require 'domain_crawler/domain_parser'

module DomainCrawler
  def self.run(args)
    argv_parser = Utilities::ArgvParser.new(args)
    argv_parser.parse

    links_from_domain = parse_domain(argv_parser.options.domain)
  end

  def self.parse_domain(domain)
    puts "Parsing #{domain} ..."
    domain_parser = DomainCrawler::DomainParser.new(domain)
    pages = domain_parser.parse

    puts pages
  end
end
