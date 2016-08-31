class ChangeNameOfUserImageAttribute < ActiveRecord::Migration[5.0]
  def change
    rename_column :users, :image_url, :image
  end
end
