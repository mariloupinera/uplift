class AddCoordinatesToFavours < ActiveRecord::Migration[6.0]
  def change
    add_column :favours, :latitude, :float
    add_column :favours, :longitude, :float
  end
end
