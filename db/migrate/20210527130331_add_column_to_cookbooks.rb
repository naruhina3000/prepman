class AddColumnToCookbooks < ActiveRecord::Migration[6.0]
  def change
    add_column :cookbooks, :status, :string, default: "private"
  end
end
