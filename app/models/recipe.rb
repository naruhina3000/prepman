class Recipe < ApplicationRecord
  belongs_to :user
  has_many :planners
  has_many :steps
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients
  has_many :recipe_utensils
  has_many :utensils, through: :recipe_utensils
  has_many :shopping_list_ingredients
  has_many :shopping_lists, through: :shopping_list_ingredients
  has_many :cookbook_recipes
  has_many :cookbooks, through: :cookbook_recipes
  has_many :favorites
  has_many :reviews
  has_many :cooked_recipes

  DIFFICULTY = ["easy", "medium", "hard"]
  DIET = ["Vegan", "Vegeterian", "Pescetarian", "I eat everything", "Gluten-free", "Lactose-free"]
  DISHTYPE = ["Starter", "Main", "Dessert", "Beverages", "Snacks", "Breakfast"]
  CUISINE = ["Chinese", "Italian", "European", "American", "Iberian", "Indian", "Middle Eastern", "Japanese", "Korean", "Mexican", "Indonesian", "Others"]
  OCCASION = ["All Day Recipes", "Weeknight", "Prepare ahead", "Crowd Pleaser", "On the go", "Comfort Food", "Kid-friendly", "Finger food", "BBQ", "Christmas", "Easter", "Valentines Day", "Thanksgiving", "Halloween", "October Fest"]

  validates :title, presence: true
  validates :description, presence: true
  validates :difficulty, inclusion: { in: DIFFICULTY }
  validates :diet, inclusion: { in: DIET }
  validates :dish_type, inclusion: { in: DISHTYPE }
  validates :cuisine, inclusion: { in: CUISINE }
  validates :occasion, inclusion: { in: OCCASION }

  #validate :total_time



  def total_time
    (self.prep_time + self.bake_time) > 0
  end

end
