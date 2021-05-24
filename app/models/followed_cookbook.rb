class FollowedCookbook < ApplicationRecord
  belongs_to :user
  belongs_to :cookbook_recipe
end
