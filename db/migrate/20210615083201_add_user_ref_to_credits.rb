class AddUserRefToCredits < ActiveRecord::Migration[6.0]

  def change
    Credit.destroy_all
    add_reference :credits, :user, null: false, foreign_key: true
  end
end
