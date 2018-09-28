require_relative '../config/environment.rb'

tyler = User.new('Tyler')
diana = User.new('Diana')

sugar = Ingredient.new('sugar')
peanuts = Ingredient.new('peanuts')

recipe1 = Recipe.new('pasta', peanuts)

card1 = RecipeCard.new(20180925, 5, tyler, recipe1)
card2 = RecipeCard.new(20180926, 6, tyler, recipe1)
card3= RecipeCard.new(20180926,7,tyler,recipe1)
card4=RecipeCard.new(20180927,1,tyler,recipe1)

allergen1 = Allergen.new(tyler, sugar)
allergen2 = Allergen.new(diana, peanuts)

binding.pry

puts "done"
