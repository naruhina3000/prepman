class CreateFollowedCookbooks < ActiveRecord::Migration[6.0]
  def change
    create_table :followed_cookbooks do |t|
      t.references :user, null: false, foreign_key: true
      t.references :cookbook_recipe, null: false, foreign_key: true

      t.timestamps
    end
  end
end
