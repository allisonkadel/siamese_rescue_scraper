# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "siamese_rescue_scraper/version"

Gem::Specification.new do |spec|
  spec.name          = "siamese_rescue_scraper"
  spec.version       = SiameseRescueScraper::VERSION
  spec.authors       = ["'Ally Kadel'"]
  spec.email         = ["'akadel01@gmail.com'"]

  spec.summary       = %q{Welcome to SiameseRescueScraper. This gem provides you with a command-line application that lets you query the Siamese Rescue Adoption site, a web-based database storing cats that are available for adoption! At runtime, the gem will scrape all of the site's current listings and provide you with details about each cat, including age, sub-breed, gender, and personality. Happy adopting!}
  spec.homepage      = "https://github.com/allisonkadel/siamese_rescue_scraper.git"


  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.15"
  spec.add_development_dependency "rake", "~> 10.0"
end
