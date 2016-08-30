class AddMoreFieldsToClimbsModel < ActiveRecord::Migration[5.0]
  def change
    add_column :climbs, :name, :string
    add_column :climbs, :image_url, :string
    add_column :climbs, :longitude, :float
    add_column :climbs, :latitude, :float
    add_column :climbs, :geolocation, :boolean
    add_column :climbs, :rating, :integer
    add_column :climbs, :gear, :string, array:true
    add_column :climbs, :type, :string
    add_column :climbs, :is_gym?, :boolean
    add_column :climbs, :verification, :boolean
  end
end
