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
    puts "Siamese Cats Available:"
    puts "1 Koda - Virginia Center - 9 Yrs 6 Mon "
    puts "2 Maya - Florida - 9 Yrs 4 Mon"
    puts "3 Max - Virginia - 10 Yrs 5 Mon"
    puts "4 Powder - North Carolina - 3 Yrs 2 Mon"
  end

  def menu
    puts "Enter the number of the cat you'd like more info on. Type 'exit' to leave program."
    input = gets.strip
      if input == "1"
        puts "More info on Koda..."
      elsif input == "2"
        puts "More info on Maya..."
      elsif input == "3"
        puts "More info on Max..."
      elsif input == "4"
        puts "More info on Powder..."
      end
    menu unless input == "exit"
  end

  def goodbye
    puts "See you next time. Take care!"
  end

end
