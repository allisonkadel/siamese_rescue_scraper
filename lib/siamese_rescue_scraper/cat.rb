class SiameseRescueScraper::Cat
  attr_accessor :name, :id, :sex, :loc, :age, :weight, :points, :declawed, :datein, :bio
  @@all = []

  def initialize(cat_hash)
    cat_hash.each do |attribute, value|
      self.send("#{attribute}=",value)
    end
    @@all << self
  end

  def self.display_matches(matches_array)
    puts "Displaying cat's name, age, and point:"
    matches_array.each_with_index do |cat, index|
      puts "#{index+1} #{cat.name} --- #{cat.age} --- #{cat.points}"
    end
  end

  def self.all
    @@all
  end

  def self.search_by_location(location)
    matches = []
    for cat in @@all
      if cat.loc == location
        matches << cat
      end
    end
    matches
  end

  def self.search_by_point(point)
    matches = []
    for cat in @@all
      if cat.points == point
        matches << cat
      end
    end
    matches
  end

  def self.search_by_age(age_group)
      matches = []
      for cat in @@all
        if (cat.age.include?("Yr") && age_group == "Adult") || (!cat.age.include?("Yr") && age_group == "Kitten")
          matches << cat
        end
      end
      matches
  end


end
