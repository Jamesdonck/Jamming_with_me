class AddCoordinatesToJams < ActiveRecord::Migration[6.1]
  def change
    add_column :jams, :latitude, :float
    add_column :jams, :longitude, :float
  end
end
