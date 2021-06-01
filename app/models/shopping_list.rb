class ShoppingList < ApplicationRecord
  belongs_to :user
  has_many :shopping_list_ingredients, dependent: :destroy
  has_many :recipes, through: :shopping_list_ingredients
  validates :title, presence: true
end
