class AddDefaultValueToGearArray < ActiveRecord::Migration[5.0]
  def change
    change_column :climbs, :gear, :string, default: '[]'
  end
end
