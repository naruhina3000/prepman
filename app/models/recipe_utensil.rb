class RecipeUtensil < ApplicationRecord
  belongs_to :utensil
  belongs_to :recipe
end
