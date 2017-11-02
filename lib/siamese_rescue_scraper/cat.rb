class SiameseRescueScraper::Cat
  attr_accessor :name, :id, :sex, :loc, :point, :bio, :age, :requirements

  @@cats = []

  def initialize(cat_hash)
    cat_hash.each do |attribute, value|
      self.send("#{attribute}=",value)
    end
    @@cats << self
  end

  def self.create_from_data(cats_array)
    cats_array.each do |cat_hash|
      self.new(cat_hash)
    end
  end

  #def initialize(name, sex, location, point, age)
  #  @name = name
  #  @id = id
  #  @sex = sex
  #  @location = location
  #  @point = point
  #  @bio = bio
  #  @age = age
  #  @requirements = requirements
  #end

  def self.display
    @@cats.each_with_index do |cat, index|
      puts "#{index+1} #{cat.name} - #{cat.id} - #{cat.loc}"
    end

  end

end
