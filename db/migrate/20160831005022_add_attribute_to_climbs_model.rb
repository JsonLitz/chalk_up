class AddAttributeToClimbsModel < ActiveRecord::Migration[5.0]
  def change
    add_column :climbs, :checkins, :text
  end
end
