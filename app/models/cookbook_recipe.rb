class CookbookRecipe < ApplicationRecord
  belongs_to :recipe
  belongs_to :cookbook
  has_many :followed_cookbooks
  has_many :users, through: :followed_cookbooks

  validates :recipe, uniqueness: { scope: :cookbook }
end
