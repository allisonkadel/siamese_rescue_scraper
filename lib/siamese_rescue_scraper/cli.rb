# CLI Controller - responsible for user interactions

class SiameseRescueScraper::CLI

  def call
    puts "Siamese Cats Available:"
    list_cats
  end

  def list_cats
    puts "1 Koda - Virginia Center - 9 Yrs 6 Mon "
    puts "2 Maya - Florida - 9 Yrs 4 Mon"
    puts "3 Max, Virginia - 10 Yrs 5 Mon"
    puts "4 Powder - North Carolina - 3 Yrs 2 Mon"
  end

end
