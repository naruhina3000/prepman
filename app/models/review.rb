class Review < ApplicationRecord
  belongs_to :user
  belongs_to :recipe

  validates :rating, presence: :true
  validates :rating, numericality: { only_integer: true, greater_than: -1, less_than: 6}
  validates :content, length: { minimum: 20 }
end
