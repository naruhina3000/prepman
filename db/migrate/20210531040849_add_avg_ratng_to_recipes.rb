class AddAvgRatngToRecipes < ActiveRecord::Migration[6.0]
  def change
    add_column :recipes, :average_rating, :float, default: 0
  end
end
