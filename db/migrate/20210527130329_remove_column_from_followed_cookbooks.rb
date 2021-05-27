class RemoveColumnFromFollowedCookbooks < ActiveRecord::Migration[6.0]
  def change
    remove_reference :followed_cookbooks, :cookbook_recipe, null: false, foreign_key: true
  end
end
