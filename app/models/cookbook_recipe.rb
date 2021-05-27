class CookbookRecipe < ApplicationRecord
  belongs_to :recipe
  belongs_to :cookbook

  validates :recipe, uniqueness: { scope: :cookbook }
end
