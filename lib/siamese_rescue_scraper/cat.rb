class SiameseRescueScraper::Cat
  attr_accessor :name, :id, :sex, :location, :point, :bio, :age, :requirements

  #@@all = []

  #def initialize(cat_hash)
  #  cat_hash.each do |attribute, value|
  #    self.send("#{attribute}=",value)
  #  end
  #  @@all << self
  #end


  def initialize(name, sex, location, point, age)
    @name = name
    @id = id
    @sex = sex
    @location = location
    @point = point
    @bio = bio
    @age = age
    @requirements = requirements
  end

  def self.all
    #return array of Cat instances
    #scrape SR and return Cats based on data

    name1, sex1, location1, point1, age1 = "Koda", "Female", "Virginia Center", "Seal", "9 Yrs 6 Mon"
    name2, sex2, location2, point2, age2 = "Maya", "Female", "Florida", "Tortie", "9 Yrs 4 Mon"
    cat1 = self.new(name1, sex1, location1, point1, age1)
    cat2 = self.new(name2, sex2, location2, point2, age2)
    puts "Siamese Cats Available:"
    puts "1 #{cat1.name} - #{cat1.sex} - #{cat1.point} - #{cat1.age} - #{cat1.location}"
    puts "2 #{cat2.name} - #{cat2.sex} - #{cat2.point} - #{cat2.age} - #{cat2.location}"
    [cat1,cat2]
  end

end
