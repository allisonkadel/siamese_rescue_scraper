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

  #def list_cats
  #  @cats = SiameseRescueScraper::Cat.display
  #end

  def make_cats #returns an array of cats in the form of hashes with key/value attributes
    cats_array = SiameseRescueScraper::Scraper.scrape(URL)
    SiameseRescueScraper::Cat.create_from_data(cats_array)
  end

  def menu
    puts "\n---> Enter 'list' to list all cats"
    puts "---> Enter 'search by location' to search for cats by location"
    puts "---> Enter 'search by point' to search for cats by point"
    puts "---> Enter 'search by age' to search for cats by age group"
    input1 = gets.strip

    if input1 == "list"
      SiameseRescueScraper::Cat.display_matches(SiameseRescueScraper::Cat.all)
      puts "\nIf you would like more information on any cat, enter a number. Type 'exit' to go back or leave the program."
      input2 = gets.strip
        if input2.to_i.between?(1,SiameseRescueScraper::Cat.all.length)
          puts ""
          puts SiameseRescueScraper::Cat.all[input2.to_i-1].bio
          puts "\nID#: "
          puts SiameseRescueScraper::Cat.all[input2.to_i-1].id
          puts "\nSex: "
          puts SiameseRescueScraper::Cat.all[input2.to_i-1].sex
          puts "\nLocation: "
          puts SiameseRescueScraper::Cat.all[input2.to_i-1].loc
          puts "\nAge: "
          puts SiameseRescueScraper::Cat.all[input2.to_i-1].age
          puts "\nWeight: "
          puts SiameseRescueScraper::Cat.all[input2.to_i-1].weight
          puts "\nPoint: "
          puts SiameseRescueScraper::Cat.all[input2.to_i-1].points
          puts "\nDeclawed: "
          puts SiameseRescueScraper::Cat.all[input2.to_i-1].declawed
          puts "\nDate In: "
          puts SiameseRescueScraper::Cat.all[input2.to_i-1].datein
          puts ""
        end
      #menu unless input2 == "exit"

    elsif input1 == "search by location"
      puts "\nEnter one of the following:\n\nVirginia Center\nVirginia\nFlorida\nNorth Carolina\nMaryland\nPennsylvania\nTennessee\nIndiana\nSouth Carolina\nIllinois\nConnecticut"
      input3 = gets.strip
      puts "\nHere are the cats available in #{input3}:"
      SiameseRescueScraper::Cat.display_matches(SiameseRescueScraper::Cat.search_by_location(input3))

    elsif input1 == "search by point"
      puts "\nEnter one of the following:\nSeal\nChocolate\nTortie\nSnowshoe\nBlue\nLynx\nFlame\nLilac\nBalinese"
      input4 = gets.strip
      puts "\nHere are the #{input4} point cats:"
      SiameseRescueScraper::Cat.display_matches(SiameseRescueScraper::Cat.search_by_point(input4))

    elsif input1 == "search by age"
      puts "\nEnter one of the following age groups:\nKitten\nAdult\nGeezer"
      input5 = gets.strip
      puts "\nHere are the #{input5}s:"
      SiameseRescueScraper::Cat.display_matches(SiameseRescueScraper::Cat.search_by_age(input5))

    end

    menu unless input1 == "exit"

  end

  def goodbye
    puts "\nSee you next time. Have a pawsome day!"
  end

end
