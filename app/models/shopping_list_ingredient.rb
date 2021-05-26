class ShoppingListIngredient < ApplicationRecord
  belongs_to :ingredient
  belongs_to :recipe, optional: true
  belongs_to :shopping_list

  UNIT = ["ml", "gr", "unit"]


  validates :quantity, presence: true
  validates :shopping_list, uniqueness: { scope: :ingredient }
  validates :unit, inclusion: { in: UNIT }
end
