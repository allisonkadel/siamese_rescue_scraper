class SiameseRescueScraper::Cat
  attr_accessor :name, :id, :sex, :loc, :point, :bio, :age, :requirements

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
    matches_array.each_with_index do |cat, index|
      puts "#{index+1} #{cat.name} - #{cat.id} - #{cat.loc}"
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


end
