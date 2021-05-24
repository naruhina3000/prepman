class FollowedCookbook < ApplicationRecord
  belongs_to :user
  belongs_to :cookbook_recipe

  validates :cookbook_recipe, uniqueness: { scope: :user }
end
