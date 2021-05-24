class CreateRecipes < ActiveRecord::Migration[6.0]
  def change
    create_table :recipes do |t|
      t.string :title
      t.text :description
      t.integer :portion, default: 1
      t.string :difficulty
      t.integer :prep_time, default: 0
      t.integer :bake_time, default: 0
      t.integer :resting_time, default: 0
      t.string :diet
      t.string :dish_type
      t.string :cuisine
      t.string :occasion
      t.integer :calories
      t.integer :protein
      t.integer :fat
      t.integer :carb
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
