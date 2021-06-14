class AddAmountAvailableToFavourTypes < ActiveRecord::Migration[6.0]
  def change
    add_column :favour_types, :amount_available, :integer
  end
end
