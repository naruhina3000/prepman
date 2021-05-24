class RecipeIngredient < ApplicationRecord
  belongs_to :ingredient
  belongs_to :recipe

  validates :quantity, presence: true
  validates :recipe, uniqueness: { scope: :ingredient }
end
