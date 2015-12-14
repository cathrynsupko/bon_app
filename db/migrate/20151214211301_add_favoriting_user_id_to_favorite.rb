class AddFavoritingUserIdToFavorite < ActiveRecord::Migration
  def change
    add_column :favorites, :favoriting_user_id, :integer
  end
end
