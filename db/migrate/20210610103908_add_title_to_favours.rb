class AddTitleToFavours < ActiveRecord::Migration[6.0]
  def change
    add_column :favours, :title, :string
  end
end
