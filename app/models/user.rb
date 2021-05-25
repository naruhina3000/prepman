class User < ApplicationRecord
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

end


