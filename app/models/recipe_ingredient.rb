class RecipeIngredient < ApplicationRecord
  belongs_to :ingredient
  belongs_to :recipe

  UNIT = ["ml", "gr", "unit"]

  validates :quantity, presence: true
  validates :recipe, uniqueness: { scope: :ingredient }
  validates :unit, inclusion: { in: UNIT }
end

