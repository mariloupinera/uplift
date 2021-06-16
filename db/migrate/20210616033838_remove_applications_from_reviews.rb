class RemoveApplicationsFromReviews < ActiveRecord::Migration[6.0]
  def change
    remove_reference :reviews, :applications, null: false, foreign_key: true
  end
end
