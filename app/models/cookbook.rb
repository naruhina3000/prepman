class Cookbook < ApplicationRecord
  belongs_to :user
  has_many :cookbook_recipes, dependent: :destroy
  has_many :recipes, through: :cookbook_recipes
  has_many :followed_cookbooks, dependent: :destroy
  has_many :users, through: :followed_cookbooks


  validates :title, presence: true
end
