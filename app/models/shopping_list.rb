class ShoppingList < ApplicationRecord
  belongs_to :user
  has_many :shopping_list_ingredients, dependent: :destroy
  validates :title, presence: true
end
