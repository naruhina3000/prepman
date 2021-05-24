class CreateCookbooks < ActiveRecord::Migration[6.0]
  def change
    create_table :cookbooks do |t|
      t.string :title
      t.references :user, null: false, foreign_key: true
      t.boolean :public

      t.timestamps
    end
  end
end
