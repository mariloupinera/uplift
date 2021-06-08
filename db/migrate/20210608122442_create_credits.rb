class CreateCredits < ActiveRecord::Migration[6.0]
  def change
    create_table :credits do |t|
      t.integer :amount_available
      t.integer :amount_redeemed
      t.integer :balance
      t.references :application, null: false, foreign_key: true
      t.references :favour, null: false, foreign_key: true

      t.timestamps
    end
  end
end
