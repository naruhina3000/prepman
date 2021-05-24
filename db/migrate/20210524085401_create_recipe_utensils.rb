class CreateRecipeUtensils < ActiveRecord::Migration[6.0]
  def change
    create_table :recipe_utensils do |t|
      t.integer :quantity
      t.references :utensil, null: false, foreign_key: true
      t.references :recipe, null: false, foreign_key: true

      t.timestamps
    end
  end
end
