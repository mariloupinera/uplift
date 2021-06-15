class RemoveFavourFromCredits < ActiveRecord::Migration[6.0]
  def change
    remove_reference :credits, :favour, null: false, foreign_key: true
  end
end
