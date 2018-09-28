class Recipe

  attr_reader :name, :ingredients
  @@all = []
  # @@ingredients = []

  def initialize(name, ingredients)
    @name = name
    @ingredients = []
    @ingredients << ingredients
    @@all << self
  end

  def self.all
    @@all
  end

  def ingredients
    @ingredients.flatten.uniq
  end

  def self.most_popular
    hash={}
    RecipeCard.all.each do |card|
      if hash[card.recipe]!=nil
        hash[card.recipe]+=1
      else
        hash[card.recipe]=1
      end
    end
    hash.key(hash.values.max)
  end

  def allergens
    Allergen.all.select { |allergen| self.ingredients.include?(allergen.ingredient) }.map{ |all| all.ingredient }
  end

  def add_ingredients(ingredients)
    (@ingredients.concat ingredients).flatten.uniq
  end

  def users
    RecipeCard.all.select { |card| card.recipe == self }.map { |c| c.user }
  end

end
