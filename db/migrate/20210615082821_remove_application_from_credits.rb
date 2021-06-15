class RemoveApplicationFromCredits < ActiveRecord::Migration[6.0]
  def change
    remove_reference :credits, :application, null: false, foreign_key: true
  end
end
