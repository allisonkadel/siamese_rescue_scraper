# SiameseRescueScraper

Welcome to SiameseRescueScraper. This gem provides you with a command-line application that lets you query the Siamese Rescue Adoption site, a web-based database storing cats that are available for adoption! At runtime, the gem will scrape all of the site's current listings and provide you with details about each cat, including age, sub-breed, gender, and personality. Happy adopting! 

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'siamese_rescue_scraper'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install siamese_rescue_scraper

## Usage

Execute the 'siamese_rescue_scraper file, found in the 'bin' diretory, to get started. After that, you will be prompted to enter the necessary information to search for cats.

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/allisonkadel/siamese_rescue_scraper.git.
