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
    @cats = SiameseRescueScraper::Cat.all
  end

  def make_cats #returns an array of cats in the form of hashes with key/value attributes
    cats_array = SiameseRescueScraper::Scraper.scrape(URL)
    puts cats_array
    binding.pry
    #Cat.create_from_data(cats_array)
  end

  def menu
    puts "Enter the number of the cat you'd like more info on. Type 'exit' to leave program."
    input = gets.strip
      if input == "1"
        puts "More info on #{@cats[0].name}"
      elsif input == "2"
        puts "More info on #{@cats[1].name}"
      end
    menu unless input == "exit"
  end

  def goodbye
    puts "See you next time. Take care!"
  end

end
