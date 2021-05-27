class FollowedCookbook < ApplicationRecord
  belongs_to :user
  belongs_to :cookbook

  validates :cookbook, uniqueness: { scope: :user }
end
