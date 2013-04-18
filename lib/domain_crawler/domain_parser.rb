# encoding: UTF-8

require 'nokogiri'
require 'open-uri'
require 'open_uri_redirections'
require 'digest/md5'
require 'ostruct'

module DomainCrawler
  class DomainParser
    def initialize(domain)
      @domain = domain
    end

    def parse
      @doc = Nokogiri::HTML(open(@domain))
      urls = links_from_domain
      begin
        pages = pages(urls)
      rescue Exception => e
        puts
        puts "[ERROR] #{e.message}"
      end
    end

    def links_from_domain
      urls = OpenStruct.new({absolute: [], relative: []})
      @doc.css('a').each do |link|
        atag = link.attributes['href'].to_s

        next if atag.nil? || atag.empty?

        if (atag =~ /^https?/) == 0
          urls.absolute << atag
        else
          urls.relative << atag
        end
      end
      urls
    end

    def pages(urls)
      pages = []
      urls.absolute.each do |abs|
        begin
          page = OpenStruct.new()
          url = open(abs, :allow_redirections => :safe)
          page.url = abs
          page.content = 'url.read'
          page.md5 = Digest::MD5.hexdigest(url.read)
          page.error = ''
          pages << page
        rescue OpenURI::HTTPError => e
          page.url = abs
          page.error = e.message
          pages << page
        end
      end

      urls.relative.each do |abs|
        begin
          page = OpenStruct.new()
          url = open(@domain + abs, :allow_redirections => :safe)
          page.url = abs
          page.content = 'url.read'
          page.md5 = Digest::MD5.hexdigest(url.read)
          page.error = ''
          pages << page
        rescue OpenURI::HTTPError => e
          page.url = abs
          page.error = e.message
          pages << page
        end
      end

      pages
    end
  end
end
