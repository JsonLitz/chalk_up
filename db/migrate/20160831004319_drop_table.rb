class DropTable < ActiveRecord::Migration[5.0]
  def change
    drop_table :climbs_users
  end
end
