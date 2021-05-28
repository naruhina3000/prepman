class User < ApplicationRecord
  has_one_attached :photo
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :recipes, dependent: :destroy
  has_many :cookbooks, dependent: :destroy
  has_many :shopping_lists, dependent: :destroy
  has_many :planners, dependent: :destroy
  has_many :cooked_recipes
  has_many :followed_cookbooks
  has_many :favorites
  has_many :reviews

  # validates :username, presence: true, uniqueness: true
  # validates :name, presence: true

  def has_favorite?(recipe)
    # self.favorites.pluck(:kitchen_id).include? kitchen.id
    Favorite.find_by(user: self, recipe: recipe)
  end

  def has_cooked_recipe?(recipe)
    # self.favorites.pluck(:kitchen_id).include? kitchen.id
    CookedRecipe.find_by(user: self, recipe: recipe)
  end

  def has_followed_cookbook?(cookbook)
    # self.favorites.pluck(:kitchen_id).include? kitchen.id
    FollowedCookbook.find_by(user: self, cookbook: cookbook)
  end

end


