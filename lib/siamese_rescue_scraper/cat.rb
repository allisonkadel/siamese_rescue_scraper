class SiameseRescueScraper::Cat
  attr_accessor :name, :id, :sex, :loc, :age, :weight, :points, :declawed, :datein, :bio
  @@all = []

  def initialize(cat_hash)
    cat_hash.each do |attribute, value|
      self.send("#{attribute}=",value)
    end
    @@all << self
  end

  def self.create_from_data(cats_array)
    cats_array.each do |cat_hash|
      self.new(cat_hash)
    end
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

  def self.search_by_age(age_group) #need to convert age string to integer
    matches = []
    binding.pry
  end


end
