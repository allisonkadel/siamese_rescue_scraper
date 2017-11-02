# CLI Controller - responsible for user interactions
require 'nokogiri'
require 'pry'

class SiameseRescueScraper::CLI

  URL = "https://va.siameserescue.org/webbuild.php?type=adoptme&page=1&state="

  def call
    hello
    make_cats
    list_cats
    menu
    goodbye
  end

  def hello
    puts "Welcome to the Siamese Cat Rescue Center Virginia Database."
  end

  def list_cats
    @cats = SiameseRescueScraper::Cat.display
  end

  def make_cats #returns an array of cats in the form of hashes with key/value attributes
    cats_array = SiameseRescueScraper::Scraper.scrape(URL)
    SiameseRescueScraper::Cat.create_from_data(cats_array)
  end

  def menu
    puts "Enter the number of the cat you'd like to read the bio for. Type 'exit' to leave program."
    input = gets.strip
      if input.to_i.between?(1,SiameseRescueScraper::Cat.all.length)
        puts ""
        puts SiameseRescueScraper::Cat.all[input.to_i-1].bio
        puts ""
      end
    menu unless input == "exit"
  end

  def goodbye
    puts "\nSee you next time. Take care!"
  end

end
