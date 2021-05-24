class RecipeUtensil < ApplicationRecord
  belongs_to :utensil
  belongs_to :recipe

  validates :recipe, uniqueness: { scope: :utensil }
end
