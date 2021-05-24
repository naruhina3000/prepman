class Ingredient < ApplicationRecord
  has_many :recipe_ingredients
  has_many :recipes, through: :recipe_ingredients
  has_many :shopping_list_ingredients
  has many :shopping_list, through: :shopping_list_ingredients


  validates :name, presence: true
  validates :name, uniqueness: true
end
