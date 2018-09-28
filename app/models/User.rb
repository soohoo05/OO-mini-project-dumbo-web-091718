class User

  attr_reader :name
  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def add_recipe_card(recipe, date, rating)
    RecipeCard.new(date, rating, self, recipe)
  end

  # helper method to grab recipe card instances belonging to self
  def recipe_cards
    RecipeCard.all.select { |card| card.user == self }
  end

  # grab card instances of specific user
  def recipes
    self.recipe_cards.map { |card| card.recipe }
  end

  def declare_allergen(ingredient)
    Allergen.new(self, ingredient)
  end

  def allergens
    Allergen.all.select { |a| a.user == self }
  end

  def top_three_recipes
    # ratings = self.receipe_cards.map { |card| card.rating }
    top_three = []
    sorted_ratings = self.recipe_cards.sort_by { |card| card.rating }

    i = 0
    while i < 3
      top_three << sorted_ratings[i]
      i = i + 1
    end
    top_three
  end

  def most_recent_recipe
    self.recipe_cards.sort_by { |card| card.date }.last
  end

  def safe_recipes
    self.recipes.find_all do |recipes|
      self.allergens.map do |allergen|
        !(recipes.ingredients.include?(allergen.ingredient))
      end
    end
  end
end
