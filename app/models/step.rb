class Step < ApplicationRecord
  has_one_attached :photo
  belongs_to :recipe
  validates :description, length: { minimum: 10 }
  validates :description, length: { maximum: 500 }
end
