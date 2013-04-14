# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'domain_crawler/version'
require 'domain_crawler/config'

Gem::Specification.new do |gem|
  gem.name          = "domain_crawler"
  gem.version       = DomainCrawler::VERSION
  gem.authors       = ["Andy Wenk"]
  gem.email         = ["andy@nms.de"]
  gem.description   = %q{crawler for finding all URL's in a given domain and reporting them for creating webserver redirect statements}
  gem.summary       = %q{When rebuilding a web-application there is most often the case, that URL's have changed and there is a need to redirect these URL's with the http status code 301 to a new ressource. After a short search in the WWW, I did not find a gem or software which fits my needs. This software will have the ability to report a list of found URL's. Bonus points for creating Nginx or Apache rewrite / redirect rules.}
  gem.homepage      = DomainCrawler::HOMEPAGE

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
  gem.required_ruby_version = '>= 1.9.3'

  # dependencies for production

  # dependencies for development
  gem.add_development_dependency('rspec')
end
