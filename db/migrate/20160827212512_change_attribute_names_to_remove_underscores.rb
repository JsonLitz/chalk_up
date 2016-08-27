class ChangeAttributeNamesToRemoveUnderscores < ActiveRecord::Migration[5.0]
  def change
    rename_column :climbs, :is_gym?, :gym?
    rename_column :climbs, :image_url, :image
    rename_column :users, :is_admin?, :admin?
  end
end
