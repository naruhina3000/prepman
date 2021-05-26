class AddColumnsToShoppingListIngredients < ActiveRecord::Migration[6.0]
  def change
    add_column :shopping_list_ingredients, :quantity, :float
    add_column :shopping_list_ingredients, :unit, :string
  end
end
