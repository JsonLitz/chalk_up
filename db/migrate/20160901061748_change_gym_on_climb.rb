class ChangeGymOnClimb < ActiveRecord::Migration[5.0]
  def change
    rename_column :climbs, :gym?, :gym
  end
end
