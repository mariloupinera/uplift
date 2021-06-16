class AddApplicationRefToReviews < ActiveRecord::Migration[6.0]
  def change
    add_reference :reviews, :application, null: false, foreign_key: true
  end
end
