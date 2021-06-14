class RemoveAmountAvailableFromCredits < ActiveRecord::Migration[6.0]
  def change
    remove_column :credits, :amount_available, :integer
  end
end
