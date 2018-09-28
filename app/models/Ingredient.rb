class Ingredient

  attr_reader :name
  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def allergens
    Allergen.all.select { |a| a.ingredient == self }
  end

  def self.most_common_allergen
    hash={}
    Allergen.all.each do |allergen|
      if hash.keys.include?(allergen.ingredient)
      # if hash[allergen.ingredient]!=nil
        hash[allergen.ingredient] += 1
      else
        hash[allergen.ingredient] = 1
      end
    end
    hash.key(hash.values.max)
  end

end
