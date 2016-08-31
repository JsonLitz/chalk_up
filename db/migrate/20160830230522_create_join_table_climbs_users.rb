class CreateJoinTableClimbsUsers < ActiveRecord::Migration[5.0]
  def change
    create_join_table :climbs, :users do |t|
      t.index [:climb_id, :user_id]
      t.index [:user_id, :climb_id]
    end
  end
end
