class Review < ApplicationRecord
  RATING = [ "0", "1", "2", "3", "4", "5"]
  has_one_attached :photo
  belongs_to :user
  belongs_to :recipe

  validates :rating, presence: :true
  validates :rating, numericality: { only_integer: true, greater_than: -1, less_than: 6}
  # validates :content, length: { minimum: 20 }
  after_create :set_avg_rating

  def set_avg_rating
    ratings = self.recipe.reviews.pluck(:rating)
    self.recipe.update(average_rating: ratings.sum.to_f / ratings.count)
  end
end
