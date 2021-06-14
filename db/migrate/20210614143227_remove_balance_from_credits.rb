class RemoveBalanceFromCredits < ActiveRecord::Migration[6.0]
  def change
    remove_column :credits, :balance, :integer
  end
end
