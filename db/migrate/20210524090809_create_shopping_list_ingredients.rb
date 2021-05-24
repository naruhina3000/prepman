class CreateShoppingListIngredients < ActiveRecord::Migration[6.0]
  def change
    create_table :shopping_list_ingredients do |t|
      t.references :ingredient, null: false, foreign_key: true
      t.references :recipe, foreign_key: true
      t.references :shopping_list, null: false, foreign_key: true

      t.timestamps
    end
  end
end
