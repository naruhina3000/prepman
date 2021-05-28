class RemoveColumnFromCookbooks < ActiveRecord::Migration[6.0]
  def change
    remove_column :cookbooks, :public, :boolean
  end
end
