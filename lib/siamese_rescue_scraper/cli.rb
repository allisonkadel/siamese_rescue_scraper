# CLI Controller - responsible for user interactions

class SiameseRescueScraper::CLI

  def call
    hello
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
