class User < ApplicationRecord
  devise :omniauthable, omniauth_providers: [:facebook]
  has_one_attached :photo
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :recipes, dependent: :destroy
  has_many :cookbooks, dependent: :destroy
  has_many :shopping_lists, dependent: :destroy
  has_many :planners, dependent: :destroy
  has_many :cooked_recipes, dependent: :destroy
  has_many :followed_cookbooks, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :reviews, dependent: :destroy

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

  def self.find_for_facebook_oauth(auth)
    user_params = auth.slice("provider", "uid")
    user_params.merge! auth.info.slice("email", "first_name", "last_name")
    user_params[:facebook_picture_url] = auth.info.image
    user_params[:token] = auth.credentials.token
    user_params[:token_expiry] = Time.at(auth.credentials.expires_at)
    user_params = user_params.to_h

    user = User.find_by(provider: auth.provider, uid: auth.uid)
    user ||= User.find_by(email: auth.info.email) # User did a regular sign up in the past.
    if user
      user.update(user_params)
    else
      user = User.new(user_params)
      user.name = "#{user_params['first_name']} #{user_params['last_name']}"
      user.username = user_params['first_name']
      user.password = Devise.friendly_token[0,20]  # Fake password for validation
      user.save
    end

    return user
  end

end


