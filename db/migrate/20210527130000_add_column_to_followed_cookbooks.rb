class AddColumnToFollowedCookbooks < ActiveRecord::Migration[6.0]
  def change
    add_reference :followed_cookbooks, :cookbook, null: false, foreign_key: true
  end
end
