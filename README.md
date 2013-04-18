# domain_crawler

THIS IS UNDER HEAVY DEVELOPMENT - EXPECT THAT THINGS BREAK ;-)

**version:** 0.0.2

[![Code Climate](https://codeclimate.com/github/andywenk/domain_crawler.png)](https://codeclimate.com/github/andywenk/domain_crawler)

## Motivation

When rebuilding a web-application there is most often the case, that URL's have changed and there is a need to redirect these URL's with the http status code 301 to a new ressource. After a short search in the WWW, I did not find a gem or software which fits my needs. This software will have the ability to report a list of found URL's. Bonus points for creating Nginx or Apache rewrite / redirect rules.

## Where is it right now?

Under development. Right now this is more a sketch and proof of concept. I will check out the best way how to implement all this. Naming of methods is mostly crap at the moment ...

## Requirements

* crawl a website starting from the root path and find all sites in the domain
* store all found sites in a database with the following info
    * url
    * content as html
    * content represented as MD5 hash
    * created_at
    * updated_at
    * optional ability to distinguish sites by it's GET parameters
    * reporting of the found sites in JSON
    * rerunning the site-crawl and update the data in the database

## Tools

* Ruby CLI
* CouchDB
* make a gem

## Installation

Add this line to your application's Gemfile:

    gem 'domain_crawler'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install domain_crawler

## Usage

TODO: Write usage instructions here

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
