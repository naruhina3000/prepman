class ShoppingListIngredient < ApplicationRecord
  belongs_to :ingredient
  belongs_to :recipe, optional: true
  belongs_to :shopping_list


  validates :quantity, presence: true
  validates :shopping_list, uniqueness: { scope: :ingredient }
end
