# CLI Controller - responsible for user interactions
require 'nokogiri'
require 'pry'

class SiameseRescueScraper::CLI

  URL = "https://va.siameserescue.org/webbuild.php?type=adoptme&page=1&state="

  def call
    hello
    make_cats
    menu
    goodbye
  end

  def hello
    puts "\nWelcome to the Siamese Cat Rescue Center Virginia Database. [Loading cats...]"
  end

  def make_cats
    cats_array = SiameseRescueScraper::Scraper.scrape(URL)
    for cat_hash in cats_array
      SiameseRescueScraper::Cat.new(cat_hash)
    end
  end

  def more_info(matches)
    puts "\nIf you would like more information on any cat, enter a number. Type 'exit' to go back or leave the program."
    input2 = gets.strip
    if input2.to_i.between?(1,matches.length)
      puts ""
      puts matches[input2.to_i-1].bio
      puts "\nID#: "
      puts matches[input2.to_i-1].id
      puts "\nSex: "
      puts matches[input2.to_i-1].sex
      puts "\nLocation: "
      puts matches[input2.to_i-1].loc
      puts "\nAge: "
      puts matches[input2.to_i-1].age
      puts "\nWeight: "
      puts matches[input2.to_i-1].weight
      puts "\nPoint: "
      puts matches[input2.to_i-1].points
      puts "\nDeclawed: "
      puts matches[input2.to_i-1].declawed
      puts "\nDate In: "
      puts matches[input2.to_i-1].datein
      puts ""
    end
  end

  def menu
    puts "\n---> Enter 'all' to list all cats"
    puts "---> Enter 'search by location' to search for cats by location"
    puts "---> Enter 'search by point' to search for cats by point"
    puts "---> Enter 'search by age' to search for cats by age group"
    input = gets.strip

    if input == "all"
      matches = SiameseRescueScraper::Cat.display_matches(SiameseRescueScraper::Cat.all)
      self.more_info(matches)

    elsif input == "search by location"
      puts "\nEnter one of the following:\n\nVirginia Center\nVirginia\nFlorida\nNorth Carolina\nMaryland\nPennsylvania\nTennessee\nIndiana\nSouth Carolina\nIllinois\nConnecticut"
      response = gets.strip
      puts "\nHere are the cats available in #{response}:"
      matches = SiameseRescueScraper::Cat.display_matches(SiameseRescueScraper::Cat.search_by_location(response))
      self.more_info(matches)

    elsif input == "search by point"
      puts "\nEnter one of the following:\nSeal\nChocolate\nTortie\nSnowshoe\nBlue\nLynx\nFlame\nLilac\nBalinese"
      response = gets.strip
      puts "\nHere are the #{input4} point cats:"
      matches = SiameseRescueScraper::Cat.display_matches(SiameseRescueScraper::Cat.search_by_point(response))
      self.more_info(matches)

    elsif input == "search by age"
      puts "\nEnter one of the following age groups:\nKitten\nAdult"
      response = gets.strip
      puts "\nHere are the #{response}s:"
      matches = SiameseRescueScraper::Cat.display_matches(SiameseRescueScraper::Cat.search_by_age(response))
      self.more_info(matches)
    end

    menu unless input == "exit"

  end

  def goodbye
    puts "\nSee you next time. Have a pawsome day!"
  end

end
